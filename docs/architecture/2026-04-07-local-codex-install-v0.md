# cmon Local Codex Install v0

Date: 2026-04-07
Status: Draft

This document defines how to install `cmon` into a local Codex environment without copying the skill source.

## Goal

Use the live repo as the source of truth so `cmon` skills can be edited in place and reused immediately after a Codex restart.

## Why Direct Per-Skill Symlinks Are Not Enough

`cmon` skills do not live as isolated single-folder prompts.

They routinely refer to repo-root resources such as:

- `agents/`
- `templates/`
- `docs/`

If only `skills/<name>/` is symlinked into `~/.codex/skills/`, those repo-relative references become ambiguous or wrong from Codex's installed skill path.

So the install model needs two layers:

1. one repo-level symlink into Codex-managed storage
2. thin installed wrapper skills that point to the canonical source in the symlinked repo

## Install Model

The local installer script does this:

1. create `~/.codex/vendor_imports/cmon -> <repo-root>`
2. create wrapper skill folders in `~/.codex/skills/`
3. preserve the canonical skill source in the live repo

Wrapper folder names are filesystem-safe:

- `cmon-understand`
- `cmon-think`
- `cmon-plan`
- ...

But the trigger names remain the canonical names from frontmatter:

- `cmon:understand`
- `cmon:think`
- `cmon:plan`
- ...

## Script

Use:

- `scripts/link_codex_skills.py install`
- `scripts/link_codex_skills.py status`
- `scripts/link_codex_skills.py uninstall`
- `scripts/link_codex_skills.ps1 install`
- `scripts/link_codex_skills.ps1 status`
- `scripts/link_codex_skills.ps1 uninstall`

Optional flags:

- `--codex-home <path>`
- `--force`
- `-CodexHome <path>` for PowerShell
- `-Force` for PowerShell

## Expected Workflow

1. Run the installer once.
2. Restart Codex.
3. Use the `cmon:*` skills normally.
4. Keep editing the repo in place.
5. Restart Codex again when you want Codex to reload changed skill content.

## Non-Goals

This installer should not become:

- a plugin manager
- a marketplace publisher
- a runtime daemon
- a hidden copy-based sync tool

It is intentionally a narrow local-dev installation path.
