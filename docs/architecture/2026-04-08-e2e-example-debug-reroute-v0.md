# cmon End-to-End Example: Debug Reroute v0

Date: 2026-04-08
Status: Draft

This document records a small proof case for `cmon:debug`.

Its purpose is to prove one very specific workflow claim:

- `cmon:work` can stop when the right next action is root-cause clarification rather than another implementation guess
- `cmon:debug` can clarify the blocked boundary
- the workflow can then return to `cmon:work` with a narrower justified implementation move

## Example Task

Operationalize `cmon:debug` enough that it can support a real work-to-debug-to-work reroute, not just a philosophical skill definition.

## Artifact Chain

### Work

- Initial work manifest: `docs/architecture/2026-04-08-debug-reroute-work-run-manifest.md`
- Work-to-debug transition: `docs/architecture/2026-04-08-debug-reroute-work-to-debug-transition.md`

### Debug

- Debug run manifest: `docs/architecture/2026-04-08-debug-reroute-debug-run-manifest.md`
- Debug report: `docs/architecture/2026-04-08-debug-reroute-debug-report.md`
- Debug-to-work transition: `docs/architecture/2026-04-08-debug-reroute-debug-to-work-transition.md`

### Resumed Work

- Verification evidence: `docs/architecture/2026-04-08-debug-reroute-verification.md`
- Execution report: `docs/architecture/2026-04-08-debug-reroute-execution-report.md`

## What This Example Proved

- `cmon:debug` is not just a conceptual skill; it now supports a bounded investigation pass with explicit artifacts.
- `cmon:work` does not need to hide uncertainty by guessing the fix when the real problem is an unclear failure boundary.
- a debug pass can produce a narrower implementation move instead of a broad exploratory rewrite.

## What It Still Does Not Prove

- It does not yet prove a stack-specific debugging case in an external codebase.
- It does not yet prove browser-driven debugging.
- It does not yet prove a multi-pass debug loop with repeated discarded hypotheses.
