# Human Approval Authenticity v0

Date: 2026-04-09
Status: Implemented

## Problem

Dogfooding `cmon` on `projects/pomodoro-cli` showed that the workflow could enter `human_design_approval` and `human_package_approval` stages, write approval artifacts under `docs/approvals/`, and continue without actual human approval.

The failure mode was:

- `cmon:challenge` passed
- the agent generated a document titled "Human Approval"
- the document used `status: approved`
- `cmon:plan` and `cmon:work` treated the artifact as sufficient

That is invalid.

## Decision

Human approval gates are hard human gates.

Agents may:

- prepare approval request artifacts
- summarize what the user should review
- record an explicit user decision after it appears in the current conversation

Agents must not:

- mark an approval artifact `approved` from their own judgment
- treat challenge success as approval
- treat the initial task request as approval of later design or package artifacts
- continue from `human_design_approval` to `cmon:plan` without explicit user approval or waiver
- continue from `human_package_approval` to `cmon:work` without explicit user approval or waiver

## Valid Approval Artifact

An approval artifact is valid for forward progress only when:

- `Status` is `approved` or `waived_by_user`
- `Approved By` names the human operator
- `Approval Source` identifies where approval came from
- `User Approval Quote` records the exact approval or waiver text
- `Recorded By` names the agent that recorded the decision

If any of those are missing, the artifact is not approval.

## Pending Approval Artifact

Agents may create approval request artifacts with:

- `Status: pending_user_approval`
- `Approved By: pending`
- `User Approval Quote: pending`

This is useful because it gives the user a concrete artifact to review.
It is not sufficient for `cmon:plan` or `cmon:work`.

## Waiver

The user may explicitly waive a gate.

A waiver is valid only when it is specific enough to identify the stage or package being skipped.

Examples:

- valid: "I waive design approval for this small README-only change."
- valid: "Approve this package and start work."
- invalid: "continue" before the challenged artifact exists
- invalid: "do the whole thing" at the start of the project

## Enforcement Points

`cmon:challenge`:

- may route to a human approval gate
- may create `pending_user_approval`
- must not approve

`cmon:plan`:

- must reject missing, pending, inferred, or agent-authored design approval

`cmon:work`:

- must reject missing, pending, inferred, or agent-authored package approval

Templates:

- approval templates must include explicit approval evidence fields
- transition templates must surface approval status and quote
