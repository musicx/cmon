---
name: cmon:plan
description: Use after approved requirements and design, or when behavior is already clear enough, to define a bounded implementation plan with explicit scope, sequencing, traceability, and verification.
---

# cmon:plan

Define how approved work will be implemented.

`cmon:plan` should be strict enough to constrain execution, but not so script-like that it becomes implementation itself.

Its job is to produce a decision-quality implementation plan that gives `cmon:work` a safe boundary.

Every `cmon:plan` output should include two artifacts:

- a human-readable Markdown implementation plan
- a machine-readable execution JSON at `docs/plans/<slug>.execution.json`

The JSON is required even for one-task plans because it records status, dependencies, acceptance criteria, and progress expectations for `cmon:work`.

`cmon:plan` now has two canonical modes:

- `create` for writing a new implementation plan
- `deepen` for strengthening an existing plan in place

## Preconditions

Use this skill when one of these is true:

- `cmon:think` already produced an approved requirements artifact
- `cmon:design` already produced a human-approved design artifact
- the user provided sufficiently clear behavior, scope, and success criteria

If product behavior or chosen direction is still ambiguous, go back to `cmon:think`.
If flow, state, or boundary design is still ambiguous, go back to `cmon:design`.
If the work is a greenfield project, a new user-facing CLI/API/UI/operator surface, or introduces persistence, config, or multiple workflows, require an explicit design artifact before planning.
If a required design artifact has not passed valid `human_design_approval`, do not plan yet.

Valid `human_design_approval` means:

- approval status is `approved` or `waived_by_user`
- `Approved By` identifies the human, not the agent
- `User Approval Quote` records the exact user approval or waiver
- approval happened after `cmon:challenge(mode=design)`
- the artifact is not merely an agent-authored `pending_user_approval` request

## Required Outputs

Produce a plan that includes:

1. Problem summary
2. Requirements and design trace
3. Human design approval trace when design was required
4. Scope boundary and non-goals
5. Implementation units
6. Files or modules in scope per unit
7. Sequencing and dependencies
8. Patterns to follow
9. Test scenarios and verification expectations
10. Risks or deferred questions
11. Execution JSON path and task graph status

Use `templates/plans/implementation-plan-template.md` as the default starting structure.
Use `templates/plans/execution-graph-template.json` for the required execution JSON.
Use `templates/plans/plan-run-manifest-template.md` when planning mode, research scope, or upstream inputs should be explicit before the pass begins.
Use `templates/plans/plan-critique-input-template.md` when the plan should pass through an internal engineering quality critique before package challenge.

## Plan Philosophy

The plan is not implementation code.

It should answer:

- what gets changed
- in what order
- under what constraints
- which existing patterns should be followed
- what must be tested
- how correctness will be checked
- what research and prior knowledge shaped the chosen structure when that matters

It should not try to pre-write all production code.

## Quality Bar

A plan is not ready unless:

- requirements and design decisions are traceable
- human design approval is referenced when design was required
- the execution JSON exists and matches the Markdown plan
- exact file paths are named
- every feature-bearing unit has concrete test scenarios
- execution boundaries are small enough to review cleanly
- no critical requirement is delegated to executor improvisation
- the current `understand` packet, when one exists, has been consumed rather than ignored
- local patterns and prior learnings have been considered
- deferred questions are truly execution-owned rather than hidden planning gaps
- non-trivial plans have survived a lightweight planning critique before package challenge

## Workflow

1. Resolve whether this pass is `create` or `deepen`
2. Read the current `understand` packet when one exists
3. Read the approved requirements source
4. Read the approved design source when one exists
5. Re-read local repo constraints, patterns, and prior learnings
6. Run conditional external research when the topic is risky or local patterns are thin
7. Define or tighten a bounded set of implementation units
8. Write or update the execution JSON task graph
9. For each unit, specify:
   - goal
   - files or modules in scope
   - constraints
   - dependencies
   - patterns to follow
   - test scenarios
   - execution note when posture matters
   - verification
10. Identify what is explicitly out of scope
11. Run a self-check for coverage, placeholders, weak research, vague tests, and JSON/Markdown mismatch
12. Run the pre-work critique stack when the plan is non-trivial, cross-cutting, or risk-bearing
13. Write the plan and execution JSON to `docs/plans/`

Use:

- `templates/plans/research-summary-template.md` when research inputs should be captured explicitly
- `templates/plans/plan-deepening-template.md` when strengthening an existing plan
- `templates/plans/plan-critique-summary-template.md` when merging critique feedback into one readiness decision

## Plan Critique Stack

For non-trivial plans, run a smaller critique stack before handing off to `cmon:challenge(mode=package)`.

The default critiques are:

1. `design-consistency-review`
   - checks whether the plan still preserves approved design and user-facing behavior

2. `engineering-feasibility-review`
   - checks whether boundaries, dependencies, architecture, and verification survive contact with the codebase

3. `scope-risk-review`
   - checks whether the plan is overreaching, under-defended, or hiding avoidable risk

This stack is intentionally smaller than `gstack` and narrower than `cmon:challenge(mode=package)`.

It is meant to tighten the engineering-owned plan before the formal multi-role package challenge.
It is not the approval gate.

## Implementation Unit Standard

Each implementation unit should be small enough to review, but large enough to matter.

Each unit must include:

- `Goal`
- `Requirements`
- `Scope`
- `Files`
- `Constraints`
- `Approach`
- `Patterns To Follow`
- `Test Scenarios`
- `Execution Note` when needed
- `Verification`
- `Done when`

## Hard Rules

- Do not silently expand scope beyond the approved artifact
- Do not omit verification expectations
- Do not omit the execution JSON
- Do not let the execution JSON drift from the Markdown plan
- Do not omit test scenarios for feature-bearing work
- Do not produce a plan that leaves execution boundaries vague
- Do not invent missing design decisions that should have been resolved earlier
- Do not move to code from this skill
- Do not skip local pattern and learning recovery
- Do not use `deepen` as a way to avoid confronting upstream ambiguity
- Do not treat an agent-authored approval request as valid human approval

## Handoff

Record the handoff using:

- `templates/workflow/stage-transition-decision-template.md`

Typical transition decisions:

- `proceed -> cmon:challenge(mode=package)`
  - when the Markdown plan and execution JSON are bounded, traced, aligned with approved design, and ready for `cmon:challenge(mode=package)`

- `revise -> cmon:plan`
  - when the plan needs stronger boundaries, verification, or critique integration

- `block`
  - when upstream ambiguity was rediscovered and planning should not continue as if it were execution-owned

The operational execution and manual procedure are documented in:

- `docs/architecture/2026-04-07-plan-execution-v0.md`
- `docs/architecture/2026-04-07-plan-operating-procedure-v0.md`
- `docs/architecture/2026-04-07-plan-review-stack-v0.md`
