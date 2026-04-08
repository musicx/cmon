# Stage Transition Decision

- From: `cmon:work`
- To: `cmon:debug`
- Decision: `block`

## Reason

The implementation unit uncovered a workflow failure rather than a pure coding task.

`cmon:debug` existed as a skill definition, but the moment execution tried to use it as an actual bounded investigation surface, two gaps appeared:

- no run manifest existed to lock one debugging pass
- no debugging report existed to support a clean root-cause handoff back into work

This means the failure is not "missing implementation detail inside the current files only."

It is a workflow-level ambiguity about how a debugging pass proves useful progress before any fix.

## Missing Conditions

- one bounded debug manifest
- one bounded debug report
- a clearer operational procedure for rerouting from failed work into debugging and back

## Outcome

Route into `cmon:debug` to clarify the missing investigation contract before resuming `cmon:work`.
