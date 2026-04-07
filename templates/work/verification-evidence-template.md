# Verification Evidence

## Unit Identity

- Plan Path: <docs/plans/...>
- Unit ID Or Title: <unit id>

## Verification Runs

- Command Or Procedure: <command or manual step>
  - Result: <pass | fail>
  - Evidence:
    - <key output or observation>

- Command Or Procedure: <command or manual step>
  - Result: <pass | fail>
  - Evidence:
    - <key output or observation>

## Coverage Notes

- What this evidence proves:
  - <claim>
- What this evidence does not prove:
  - <gap or "none">

## System Interaction Trigger

- Does this unit have non-local effects? <yes | no>
- If yes:
  - Complete `templates/work/system-interaction-check-template.md`
- If no:
  - Why not:
    - <leaf change | no callbacks | no middleware | no multi-interface exposure | other>

## Freshness Check

- Were these runs executed after the final relevant code changes? <yes | no>
- If no, why not:
  - <reason or "n/a">
