# System Interaction Check

## Unit Identity

- Plan Path: <docs/plans/...>
- Unit ID Or Title: <unit id>

## Trigger

- Why this check is required:
  - <callbacks | middleware | retries | failure cleanup | multi-interface parity | other>

## Chain Inspection

- What else fires when this unit runs?
  - <callback / middleware / observer / handler / "none">
- Did you inspect the real code path? <yes | no>
- Notes:
  - <note or "none">

## Real-Chain Coverage

- Do tests or verification exercise the real chain rather than only isolated logic? <yes | no>
- Notes:
  - <note or "none">

## Failure Cleanup

- Can failure leave orphaned state, duplicate work, or inconsistent retries? <yes | no | not_applicable>
- Notes:
  - <note or "none">

## Interface Parity

- Is this behavior exposed through multiple interfaces that should stay aligned? <yes | no>
- If yes:
  - <list interfaces and parity expectation>

## Error Strategy Alignment

- Are error handling and retry strategies coherent across layers? <yes | no | not_applicable>
- Notes:
  - <note or "none">

## Outcome

- Status: <pass | concerns>
- Required Follow-Up:
  - <follow-up or "none">
