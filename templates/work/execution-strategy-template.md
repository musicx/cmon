# Execution Strategy Record

## Unit Identity

- Plan Path: <docs/plans/...>
- Unit ID Or Title: <unit id>

## Strategy Decision

- Strategy: <inline | serial | parallel>
- Why This Strategy Fits:
  - <reason>
  - <reason>

## Delegation Shape

- Inline Executor:
  - <single executor or "not applicable">
- Serial Sub-Steps:
  - <step or "none">
- Parallel Sub-Steps:
  - <step or "none">

## Write Scope Check

- Shared Write Scope Exists: <yes | no>
- If no:
  - <list each sub-step and its write scope>
- If yes:
  - `parallel` is not allowed

## Dependency Check

- Are there in-flight dependencies between sub-steps? <yes | no>
- If yes:
  - use `serial` or `inline`

## Reviewability Check

- Can the merged result still be reviewed coherently as one approved unit? <yes | no>
- Notes:
  - <note or "none">
