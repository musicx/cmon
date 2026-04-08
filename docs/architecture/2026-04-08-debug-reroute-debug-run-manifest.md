# Debug Run Manifest

## Scope

- Symptom: `cmon:debug` cannot yet support a real bounded investigation handoff from `cmon:work`
- Investigation goal: determine the smallest missing contract needed for `cmon:debug` to be operational
- Current likely boundary: debugging workflow artifacts and execution docs

## Reproduction

- Status: `reproducible_now`
- Current repro path: attempt to use `cmon:debug` as a real reroute target from `cmon:work`
- Missing conditions, if any: none

## Inputs

- Relevant command or test: manual workflow check against `skills/debug/SKILL.md`
- Relevant artifact references:
  - `docs/architecture/2026-04-08-debug-skill-v0.md`
  - `skills/debug/SKILL.md`
  - `docs/architecture/2026-04-07-work-operating-procedure-v0.md`
- Relevant code paths:
  - `skills/debug/SKILL.md`
  - `docs/architecture/`
  - `templates/`
- Recent changes worth checking:
  - initial addition of `cmon:debug` without execution docs or templates

## Evidence Available Now

- Exact failing output: no shell failure; workflow failure is structural
- Logs or traces: none
- State or data clues: skill exists, but the operator has no concrete manifest or report structure to run a pass cleanly

## Pass Stop Condition

- This debug pass is complete when the smallest missing operational contract is stated clearly enough to resume bounded implementation

## Expected Next Route

- Likely next skill if root cause is confirmed: `cmon:work`
