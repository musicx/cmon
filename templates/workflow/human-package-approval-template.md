# Human Package Approval

## Approval Target

- Design Artifact Path: <docs/designs/... | docs/architecture/...>
- Plan Artifact Path: <docs/plans/...>
- Execution JSON Path: <docs/plans/...execution.json>
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
- Agents must not set `Status: approved` or `Status: waived_by_user` without an explicit user approval or waiver for this specific design / plan / execution JSON package after `cmon:challenge(mode=package)`.
- Approval of the overall task, challenge success, or agent judgment is not valid approval.
- If the user requests changes, record `changes_required` and route back to `cmon:plan` or `cmon:design`.

## What Is Approved

- Design / Plan Alignment:
  - <alignment summary>
- Execution Graph:
  - <task graph summary>
- Implementation Boundaries:
  - <boundary summary>
- Verification Strategy:
  - <verification summary>

## Required Changes Before Work

- <required change or "none">

## Accepted Risks

- <risk or "none">

## Next Step

- <wait_for_user | proceed -> cmon:work | revise -> cmon:plan | revise -> cmon:design | block>
