# Debug Report

## Symptom

- Symptom: `cmon:debug` exists as a concept but cannot yet act as a reliable reroute target from `cmon:work`
- Scope investigated: debugging workflow contract only

## Reproduction Status

- Status: `reproducible_now`
- Confirmed repro path: attempt to use `cmon:debug` after a blocked work pass
- Remaining uncertainty: none material for this pass

## Evidence Gathered

- Commands or tests run: manual inspection of the current `cmon:debug` skill and existing `cmon` workflow template set
- Key output: no `templates/debug/*` artifacts existed, and no execution or operating procedure documented a debugging reroute loop
- Code path inspected:
  - `skills/debug/SKILL.md`
  - `docs/architecture/2026-04-07-work-operating-procedure-v0.md`
  - `templates/`
- Boundary narrowed to: `cmon:debug` lacked operational artifacts, not philosophical intent

## Hypothesis

- Current hypothesis: the real failure is missing operational scaffolding for bounded debug passes, not an unclear debugging philosophy
- Why it was plausible: the skill already defined purpose and hard rules, but not the concrete artifacts needed for a real pass
- Check used to validate it: direct inspection of the current skill, procedure set, and template tree
- Result: `confirmed`

## Result

- Confirmed root cause: `cmon:debug` lacked a run manifest, a report template, and execution/operating docs, so it could not support a clean work-to-debug-to-work handoff

## Recommended Next Action

- Next action: add minimal debug execution docs plus a debug run manifest and debug report template, then resume `cmon:work`
- Why this is the smallest justified move: it closes the operational gap without widening scope into browser tooling, issue integrations, or runtime debugging infrastructure
