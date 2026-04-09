# Human Design Approval

## Approval Target

- Design Artifact Path: <docs/designs/... | docs/architecture/...>
- Challenge Summary Path: <path>
- Challenge Disposition Path: <path>

## Approval Decision

- Status: <pending_user_approval | approved | changes_required | rejected | waived_by_user>
- Approved By: <human name or handle | "pending">
- Approval Date: <YYYY-MM-DD>
- Approval Source: <current_chat | issue_comment | PR_comment | external_record | pending>
- User Approval Quote:
  - <exact user approval / requested changes / waiver quote, or "pending">
- Recorded By: <agent/model name>
- Recorder Note:
  - <what the agent recorded, or "pending">

## Agent Recording Rules

- Agents may create this artifact with `Status: pending_user_approval`.
- Agents must not set `Status: approved` or `Status: waived_by_user` without an explicit user approval or waiver for this design artifact after `cmon:challenge(mode=design)`.
- Approval of the overall task, challenge success, or agent judgment is not valid approval.
- If the user requests changes, record `changes_required` and route back to `cmon:design`.

## What Is Approved

- Product Behavior:
  - <approved behavior summary>
- Interaction Model:
  - <approved interaction summary>
- State And Failure Handling:
  - <approved state/failure summary>
- Boundaries And Non-Goals:
  - <approved boundary summary>

## Required Changes Before Planning

- <required change or "none">

## Accepted Risks

- <risk or "none">

## Next Step

- <wait_for_user | proceed -> cmon:plan | revise -> cmon:design | block>
