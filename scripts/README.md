# cmon Scripts

This directory is reserved for lightweight helper scripts.

In v0, `cmon` is still document-first. The review helper is defined by docs and templates before any script automation is added.

One exception now exists:

- local Codex installation support for live skill development

## Intended Script Scope

Future scripts here may help with:

- installing `cmon` skills into local Codex via live wrappers
- resolving work-unit manifests
- rendering verification or execution reports
- resolving review scope
- rendering review context bundles
- generating reviewer invocation packets
- preparing synthesizer input

## Non-Goals

Scripts in this directory should not become:

- a background runtime
- a deploy pipeline
- a full lifecycle orchestrator
- an auto-fix engine

## Likely First Additions

- `review_collect_inputs.*`
- `review_render_bundle.*`
- `review_prepare_synthesis.*`

The first script should stay narrow and support `cmon:review` only.

Current local-dev script:

- `link_codex_skills.py`
  - installs live wrapper skills into `~/.codex/skills/`
  - keeps the canonical source in this repo through a symlinked vendor import
