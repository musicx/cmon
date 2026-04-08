#!/usr/bin/env python3
"""Install live cmon skills into Codex through a repo symlink plus thin wrappers.

Why wrappers instead of symlinking each skill directory directly:

- cmon skills refer to `agents/`, `templates/`, and `docs/` at the repo root
- Codex resolves skill-relative paths from the installed skill directory
- direct per-skill symlinks would therefore break those repo-relative references

This script solves that by:

1. creating one symlink from `$CODEX_HOME/vendor_imports/cmon` to this repo
2. generating thin wrapper skill folders in `$CODEX_HOME/skills/`
3. having each wrapper point Codex at the canonical skill source in the live repo

That keeps the installed skills live-updating while preserving repo-relative guidance.
"""

from __future__ import annotations

import argparse
import json
import os
import shutil
import sys
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[1]
SKILLS_ROOT = REPO_ROOT / "skills"
MARKER_FILE = ".cmon-wrapper.json"
VENDOR_NAME = "cmon"


def parse_frontmatter(skill_path: Path) -> tuple[str, str]:
    text = skill_path.read_text(encoding="utf-8")
    if not text.startswith("---\n"):
        raise ValueError(f"{skill_path} is missing YAML frontmatter")

    parts = text.split("---\n", 2)
    if len(parts) < 3:
        raise ValueError(f"{skill_path} has invalid YAML frontmatter")

    frontmatter = parts[1].splitlines()
    name = ""
    description = ""

    for line in frontmatter:
        if line.startswith("name:"):
            name = line.split(":", 1)[1].strip()
        elif line.startswith("description:"):
            description = line.split(":", 1)[1].strip().strip('"')

    if not name or not description:
        raise ValueError(f"{skill_path} is missing name or description in frontmatter")

    return name, description


def discover_skills() -> list[Path]:
    return sorted(path.parent for path in SKILLS_ROOT.glob("*/SKILL.md"))


def wrapper_dir_name(source_dir: Path) -> str:
    return f"cmon-{source_dir.name}"


def wrapper_body(
    *,
    skill_name: str,
    description: str,
    source_skill_path: Path,
    vendor_repo_path: Path,
) -> str:
    return f"""---
name: {skill_name}
description: {description}
---

# {skill_name}

This is a local wrapper skill installed from the live `cmon` repository.

Canonical source:

- `{source_skill_path}`

Canonical repo root:

- `{vendor_repo_path}`

Use this wrapper as follows:

1. Read the canonical source file above before doing anything else.
2. Resolve any `skills/`, `agents/`, `templates/`, and `docs/` paths relative to the canonical repo root above, not this wrapper directory.
3. Follow the canonical source instructions as the real skill contract.

This wrapper exists so `cmon` can be updated in place through one repo symlink instead of repeated uninstall and reinstall cycles.
"""


def ensure_vendor_link(vendor_repo_path: Path, force: bool) -> None:
    vendor_repo_path.parent.mkdir(parents=True, exist_ok=True)

    if vendor_repo_path.is_symlink():
        current_target = vendor_repo_path.resolve()
        if current_target == REPO_ROOT:
            return
        if not force:
            raise RuntimeError(
                f"Vendor symlink already exists at {vendor_repo_path} and points to {current_target}. "
                "Use --force to replace it."
            )
        vendor_repo_path.unlink()
    elif vendor_repo_path.exists():
        if not force:
            raise RuntimeError(
                f"Vendor path {vendor_repo_path} already exists and is not a symlink. "
                "Use --force to replace it."
            )
        if vendor_repo_path.is_dir():
            shutil.rmtree(vendor_repo_path)
        else:
            vendor_repo_path.unlink()

    vendor_repo_path.symlink_to(REPO_ROOT, target_is_directory=True)


def ensure_wrapper(
    *,
    skill_dir: Path,
    install_root: Path,
    vendor_repo_path: Path,
    force: bool,
) -> None:
    skill_name, description = parse_frontmatter(skill_dir / "SKILL.md")
    wrapper_dir = install_root / wrapper_dir_name(skill_dir)
    source_skill_path = vendor_repo_path / "skills" / skill_dir.name / "SKILL.md"

    if wrapper_dir.exists():
        marker_path = wrapper_dir / MARKER_FILE
        if not marker_path.exists():
            if not force:
                raise RuntimeError(
                    f"Wrapper destination {wrapper_dir} already exists and is not managed by cmon. "
                    "Use --force to replace it."
                )
            shutil.rmtree(wrapper_dir)
        else:
            marker = json.loads(marker_path.read_text(encoding="utf-8"))
            if marker.get("repo_root") != str(REPO_ROOT) and not force:
                raise RuntimeError(
                    f"Wrapper destination {wrapper_dir} belongs to another repo root. "
                    "Use --force to replace it."
                )
            shutil.rmtree(wrapper_dir)

    wrapper_dir.mkdir(parents=True, exist_ok=True)
    (wrapper_dir / "SKILL.md").write_text(
        wrapper_body(
            skill_name=skill_name,
            description=description,
            source_skill_path=source_skill_path,
            vendor_repo_path=vendor_repo_path,
        ),
        encoding="utf-8",
    )
    (wrapper_dir / MARKER_FILE).write_text(
        json.dumps(
            {
                "managed_by": "cmon",
                "repo_root": str(REPO_ROOT),
                "source_skill_dir": str(skill_dir),
                "skill_name": skill_name,
            },
            indent=2,
            sort_keys=True,
        )
        + "\n",
        encoding="utf-8",
    )


def install(codex_home: Path, force: bool) -> None:
    install_root = codex_home / "skills"
    vendor_repo_path = codex_home / "vendor_imports" / VENDOR_NAME
    install_root.mkdir(parents=True, exist_ok=True)

    ensure_vendor_link(vendor_repo_path, force=force)

    for skill_dir in discover_skills():
        ensure_wrapper(
            skill_dir=skill_dir,
            install_root=install_root,
            vendor_repo_path=vendor_repo_path,
            force=force,
        )

    print(f"Installed {len(discover_skills())} cmon skill wrappers into {install_root}")
    print(f"Vendor symlink: {vendor_repo_path} -> {REPO_ROOT}")
    print("Restart Codex to pick up new or updated skills.")


def uninstall(codex_home: Path) -> None:
    install_root = codex_home / "skills"
    vendor_repo_path = codex_home / "vendor_imports" / VENDOR_NAME

    removed = 0
    for skill_dir in discover_skills():
        wrapper_dir = install_root / wrapper_dir_name(skill_dir)
        marker_path = wrapper_dir / MARKER_FILE
        if wrapper_dir.is_dir() and marker_path.exists():
            marker = json.loads(marker_path.read_text(encoding="utf-8"))
            if marker.get("repo_root") == str(REPO_ROOT):
                shutil.rmtree(wrapper_dir)
                removed += 1

    if vendor_repo_path.is_symlink() and vendor_repo_path.resolve() == REPO_ROOT:
        vendor_repo_path.unlink()

    print(f"Removed {removed} cmon skill wrappers from {install_root}")


def status(codex_home: Path) -> None:
    install_root = codex_home / "skills"
    vendor_repo_path = codex_home / "vendor_imports" / VENDOR_NAME

    print(f"Repo root: {REPO_ROOT}")
    print(f"Codex home: {codex_home}")
    print(f"Vendor link: {vendor_repo_path}")

    if vendor_repo_path.is_symlink():
        print(f"  status: linked -> {vendor_repo_path.resolve()}")
    elif vendor_repo_path.exists():
        print("  status: exists but is not a symlink")
    else:
        print("  status: missing")

    print("Wrappers:")
    for skill_dir in discover_skills():
        wrapper_dir = install_root / wrapper_dir_name(skill_dir)
        marker_path = wrapper_dir / MARKER_FILE
        if wrapper_dir.is_dir() and marker_path.exists():
            marker = json.loads(marker_path.read_text(encoding="utf-8"))
            print(f"  - {wrapper_dir.name}: installed ({marker.get('skill_name')})")
        elif wrapper_dir.exists():
            print(f"  - {wrapper_dir.name}: exists but is not cmon-managed")
        else:
            print(f"  - {wrapper_dir.name}: missing")


def main() -> int:
    parser = argparse.ArgumentParser(description="Manage live cmon skill wrappers for Codex.")
    parser.add_argument(
        "command",
        choices=["install", "uninstall", "status"],
        help="Operation to perform.",
    )
    parser.add_argument(
        "--codex-home",
        default=os.environ.get("CODEX_HOME", str(Path.home() / ".codex")),
        help="Codex home directory. Defaults to $CODEX_HOME or ~/.codex.",
    )
    parser.add_argument(
        "--force",
        action="store_true",
        help="Replace existing cmon-managed wrappers or conflicting vendor symlink targets.",
    )
    args = parser.parse_args()

    codex_home = Path(args.codex_home).expanduser().resolve()

    try:
        if args.command == "install":
            install(codex_home, force=args.force)
        elif args.command == "uninstall":
            uninstall(codex_home)
        elif args.command == "status":
            status(codex_home)
        else:
            raise RuntimeError(f"Unsupported command: {args.command}")
    except Exception as exc:  # pragma: no cover - CLI error path
        print(f"error: {exc}", file=sys.stderr)
        return 1

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
