# Verify Run Manifest

## Target

- Work Execution Report: <path>
- Verification Evidence: <path>
- System Interaction Check: <path or "none">
- Scope Expansion Request: <path or "none">

## Verification Claim

- What exact unit claim is being verified:

## Verification Depth

- Depth: <quick | standard | deep | infer>
- Why:
  - <risk or proof-burden note>

## Risk Signals

- Security-sensitive: <yes | no>
- Reliability-sensitive: <yes | no>
- Performance-sensitive: <yes | no>
- Contract-sensitive: <yes | no>

## Git Commit Expectation

- Git Repo Confirmed: <yes | no>
- Commit Required If Accepted: <yes>
- Dirty Worktree Before Verify:
  - <summary or "none">
- Known Unrelated Changes:
  - <path or "none">

## Expected Route

- Expected next stage: <cmon:compound | cmon:work | infer>
