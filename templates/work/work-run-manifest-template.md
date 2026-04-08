# Work Run Manifest

## Unit Identity

- Plan Path: <docs/plans/...>
- Requirements Path: <docs/brainstorms/... or "none">
- Design Path: <docs/designs/... | docs/architecture/... | "none">
- Repo Root Or Project Directory: <path>
- Existing Git Repo Confirmed: <yes | no>
- Unit ID Or Title: <unit id>
- Requirements Reference: <R1, R2 or "none">

## Unit Boundary

- Goal: <what this unit must accomplish>
- Patterns To Follow:
  - <existing file or convention>
- Files In Scope:
  - <file>
  - <file>
- Explicit Constraints:
  - <constraint>
  - <constraint>
- Execution Note:
  - <none | test-first | characterization-first | other bounded posture>
- Out Of Scope:
  - <non-goal>
  - <non-goal>

## Verification Contract

- Execution Strategy: <inline | serial | parallel>
- Strategy Notes:
  - <why this strategy fits the unit>
  - <for parallel, list the disjoint write scopes>

- Verification Target:
  - <test/build/manual verification>
- Done Condition:
  - <behavioral result>
  - <evidence result>

## Stop Conditions

- <condition that requires stopping>
- <condition that requires returning to plan or human decision>

## Execution State

- Status: <ready | in_progress | blocked | awaiting_scope_decision | awaiting_verify | complete>
- Notes:
  - <note or "none">

## Expected Transition

- <proceed -> cmon:verify | revise -> cmon:work | block | infer>
