# cmon Local Agent Install v0

Date: 2026-04-07
Status: Updated

This document defines how to install `cmon` into a local agent skill environment without copying the skill source.

The default target is now `~/.agents`, because both Codex and opencode can read skills from the shared agents home in this workspace.
The older `~/.codex` target remains available through a deprecated compatibility flag.

## Goal

Use the live repo as the source of truth so `cmon` skills can be edited in place and reused immediately after a Codex/opencode restart.

## Why Direct Per-Skill Symlinks Are Not Enough

`cmon` skills do not live as isolated single-folder prompts.

They routinely refer to repo-root resources such as:

- `agents/`
- `templates/`
- `docs/`

If only `skills/<name>/` is symlinked into an installed skill directory, those repo-relative references become ambiguous or wrong from the host agent's installed skill path.

So the install model needs two layers:

1. one repo-level symlink into agent-managed storage
2. thin installed wrapper skills that point to the canonical source in the symlinked repo

## Install Model

The local installer script does this:

1. create `~/.agents/vendor_imports/cmon -> <repo-root>` by default
2. create wrapper skill folders in `~/.agents/skills/`
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

- `--agents-home <path>`
- `--codex-home <path>` as a deprecated alias for existing scripts
- `--force`
- `-AgentsHome <path>` for PowerShell
- `-CodexHome <path>` as a deprecated PowerShell alias
- `-Force` for PowerShell

## Expected Workflow

1. Run the installer once.
2. Restart Codex/opencode.
3. Use the `cmon:*` skills normally.
4. Keep editing the repo in place.
5. Restart Codex/opencode again when you want the host agent to reload changed skill content.

## Migration From `~/.codex`

For this workspace, use `~/.agents` as the canonical install target.

Recommended migration:

1. Run `python3 scripts/link_codex_skills.py install --force`.
2. Confirm `python3 scripts/link_codex_skills.py status` reports installed wrappers under `~/.agents`.
3. Remove old cmon-managed wrappers from `~/.codex` with `python3 scripts/link_codex_skills.py --agents-home ~/.codex uninstall` if duplicate skill loading becomes confusing.

## Non-Goals

This installer should not become:

- a plugin manager
- a marketplace publisher
- a runtime daemon
- a hidden copy-based sync tool

It is intentionally a narrow local-dev installation path.
