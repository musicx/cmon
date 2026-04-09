# Unit Checkpoint

## Checkpoint Identity

- Plan Path: <docs/plans/...>
- Execution JSON Path: <docs/plans/...execution.json>
- Execution JSON Task ID: <task id>
- Human Package Approval Path: <docs/approvals/...>
- Unit ID Or Title: <unit id>
- Checkpoint Type: <mid_unit | end_of_unit | context_switch | cluster_review>

## Current State

- Status: <in_progress | ready_for_verify | blocked | reroute_needed>
- JSON Status: <pending | in_progress | blocked | complete>
- Files Touched:
  - <file>
  - <file>
- Verification So Far:
  - <evidence or "none yet">

## Boundary Health

- Scope Still Intact: <yes | no>
- Upstream Mismatch Suspected: <none | think | design | plan>
- Escalation Needed: <yes | no>
- Reason:
  - <note>

## Simplification Review

- Simplification Opportunities Seen: <none | yes>
- Notes:
  - <duplication, cleanup, shared helper, or "none">
- Action:
  - <defer | fold into current unit | route to later unit>
