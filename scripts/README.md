# cmon Scripts

This directory is reserved for lightweight helper scripts.

In v0, `cmon` is still document-first. The review helper is defined by docs and templates before any script automation is added.

## Intended Script Scope

Future scripts here may help with:

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
