# Design / Plan Challenge, Human Approval, And Execution JSON Plan v0

Date: 2026-04-09
Status: Implemented

This document records the proposed workflow change from the 2026-04-09 dogfooding discussion.

It is accepted for implementation.

## 1. Problem

Dogfooding `cmon` on a real greenfield project exposed three workflow gaps.

### 1.1 Design Was Too Easy To Skip

A greenfield CLI project was able to move through:

```text
cmon:understand -> cmon:think -> cmon:plan -> cmon:challenge -> cmon:work -> cmon:verify
```

without an explicit `cmon:design` pass.

That made the project feel under-specified from a product and architecture standpoint:

- limited human input
- no sufficiently explicit product behavior declaration
- no clear interaction / state / failure model before planning
- plan absorbing decisions that should have been design decisions

### 1.2 Challenge Findings Were Not Inspectable Enough

`cmon:challenge` could produce a merged decision, but the operator could not easily inspect:

- what each lens challenged
- what findings were accepted
- what findings were rejected
- what was changed before moving forward

This made challenge feel less like an auditable gate and more like transient agent reasoning.

### 1.3 Plan Was Not Agent-Executable Enough

A Markdown plan is good for human review, but weak as a long-running agent execution source.

For longer coding sessions, `cmon:work` needs a structured task graph that can track:

- phases
- tasks
- dependencies
- boundaries
- expected outputs
- verification
- status
- completion state

A plan should therefore produce both:

- a human-readable Markdown plan
- a machine-readable execution JSON

The execution JSON should exist even for a one-task plan, because acceptance criteria, implementation status, and progress tracking are still useful.

## 2. Core Decision

Keep one canonical challenge skill:

- `cmon:challenge`

Do **not** split it into two top-level skills yet.

Instead, make challenge mode a first-class required field.

Canonical modes:

- `design`
- `package`

The two modes share the same skill and lifecycle machinery, but they should use separate mode-specific prompts because they ask different questions and reflect different ownership patterns.

## 3. Proposed Canonical Flow

For substantial greenfield, user-facing, stateful, or multi-workflow work:

```text
cmon:understand
-> cmon:think
-> cmon:design
-> cmon:challenge(mode=design)
-> human_design_approval
-> cmon:plan
-> cmon:challenge(mode=package)
-> human_package_approval
-> cmon:work
-> cmon:verify
-> cmon:compound
```

Not every task requires the full chain.

But this should be the default for:

- greenfield projects
- new CLI / API / UI / operator-facing surfaces
- workflows with persistent state or config
- multiple commands or modes
- meaningful failure behavior
- long-running agent execution

## 4. Challenge Modes

### 4.1 `design` Mode

Position:

```text
cmon:design -> cmon:challenge(mode=design) -> human_design_approval -> cmon:plan
```

Target artifacts:

- requirements artifact
- design artifact
- understand packet when relevant

Primary question:

> Is this design strong enough for a human to approve and for engineering planning to begin?

Challenge focus:

- does the design solve the right problem
- is the intended behavior clear
- are user / operator interactions understandable
- are states and failure paths explicit
- are boundaries and non-goals clear
- are there open product, architecture, or operational decisions that should not leak into planning

Allowed route decisions:

- `proceed -> human_design_approval`
- `revise -> cmon:design`
- `block -> cmon:think` or human decision when framing is unstable

Not allowed:

- `proceed -> cmon:plan` without human design approval
- implementation planning inside the design challenge

### 4.2 `package` Mode

Position:

```text
cmon:plan -> cmon:challenge(mode=package) -> human_package_approval -> cmon:work
```

Target artifacts:

- requirements artifact
- approved design artifact
- Markdown implementation plan
- execution JSON
- understand packet when relevant

Primary question:

> Is this design + plan + execution graph package strong enough for implementation to begin?

Challenge focus:

- does the plan faithfully implement the approved design
- why is this implementation shape appropriate
- are phases and tasks bounded correctly
- are dependencies explicit
- is the execution JSON sufficient for a coding agent to track progress over time
- are verification expectations credible
- are risks and accepted tradeoffs visible before work begins

Allowed route decisions:

- `proceed -> human_package_approval`
- `revise -> cmon:plan`
- `revise -> cmon:design` when plan exposes design mismatch
- `block -> cmon:think` or human decision when intent is unstable

Not allowed:

- `proceed -> cmon:work` without human package approval
- treating a passing package challenge as human approval

## 5. Human Approval Gates

### 5.1 Human Design Approval

Human design approval happens after `cmon:challenge(mode=design)`.

It approves:

- product behavior
- interaction model
- operator / user flow
- state and failure handling
- boundary and non-goal decisions
- known accepted risks

Required output:

- approval status
- approved design artifact path
- challenge summary path
- challenge disposition path
- approval notes
- required changes before planning, if any

Template to add:

- `templates/workflow/human-design-approval-template.md`

Approval artifacts should be stored in:

- `docs/approvals/`

### 5.2 Human Package Approval

Human package approval happens after `cmon:challenge(mode=package)`.

It approves:

- approved design + implementation plan alignment
- execution JSON task graph
- implementation boundaries
- verification strategy
- accepted implementation risks

Required output:

- approval status
- approved plan path
- approved execution JSON path
- package challenge summary path
- package challenge disposition path
- approval notes
- required changes before work, if any

Template to add:

- `templates/workflow/human-package-approval-template.md`

Approval artifacts should be stored in:

- `docs/approvals/`

## 6. Design Artifact Upgrade

`cmon:design` output is human-review-first.

It should be written so a human can carefully inspect and approve it without reconstructing the intended product from chat.

The design artifact should answer:

- what are we building
- why this behavior / flow / structure
- who uses it
- how they interact with it
- what states exist
- what failures exist
- what boundaries and non-goals are intentional
- what decisions still require approval

Recommended Markdown techniques:

- tables for states, commands, surfaces, tradeoffs, and decisions
- Mermaid flowcharts for user / operator flow
- Mermaid sequence diagrams for interaction across components
- Mermaid state diagrams for lifecycle / mode behavior
- Mermaid gantt only when timeline or phased rollout matters
- Mermaid graph diagrams when dependency or architecture shape matters

The design template should add sections for:

- decision summary
- interaction model
- state model
- failure model
- diagrams
- human review checklist

Templates to update:

- `templates/design/design-spec-template.md`

Skills / docs to update:

- `skills/design/SKILL.md`
- `docs/architecture/2026-04-07-design-execution-v0.md`
- `docs/architecture/2026-04-07-design-operating-procedure-v0.md`

## 7. Plan Artifact Upgrade

`cmon:plan` should produce two primary artifacts.

### 7.1 Markdown Implementation Plan

This remains the human-readable engineering plan.

It should explain:

- why this implementation strategy
- how it maps to approved design
- major phases
- risks and tradeoffs
- verification approach

### 7.2 Execution JSON

This is the machine-readable execution graph for `cmon:work` and long-running coding agents.

Suggested path:

- `docs/plans/<slug>.execution.json`

This file is required for every `cmon:plan` output, including one-task plans.

The JSON should contain:

- plan id
- source artifact paths
- phases
- tasks
- dependencies
- files in scope
- boundaries
- expected outputs
- verification target
- status
- completion evidence
- blocker state

It should be valid JSON, not pseudo-JSON inside Markdown.

Template to add:

- `templates/plans/execution-graph-template.json`

Skills / docs to update:

- `skills/plan/SKILL.md`
- `templates/plans/implementation-plan-template.md`
- `templates/plans/plan-run-manifest-template.md`
- `docs/architecture/2026-04-07-plan-execution-v0.md`
- `docs/architecture/2026-04-07-plan-operating-procedure-v0.md`

## 8. Work Stage Upgrade

`cmon:work` should consume the execution JSON as a progress and boundary source.

This does not replace the Markdown plan.

The intended relationship is:

- Markdown plan: human-readable approved plan
- execution JSON: agent-readable task graph and state ledger

`cmon:work` should:

- require execution JSON for long-running or multi-task work
- select tasks from the execution JSON
- update task status as work proceeds
- preserve dependency order
- record completion evidence per task
- record blockers per task
- avoid using chat memory as the task state source

Templates to update:

- `templates/work/work-run-manifest-template.md`
- `templates/work/unit-execution-report-template.md`
- `templates/work/unit-checkpoint-template.md`

Skills / docs to update:

- `skills/work/SKILL.md`
- `docs/architecture/2026-04-07-work-execution-v0.md`
- `docs/architecture/2026-04-07-work-operating-procedure-v0.md`

## 9. Challenge Traceability Upgrade

`cmon:challenge` already has per-lens and disposition templates after recent work.

This change should additionally make `Challenge Mode` mandatory across:

- run manifest
- context bundle
- lens outputs
- summary
- disposition
- transition decision

Templates to update:

- `templates/workflow/challenge-run-manifest-template.md`
- `templates/challenge/challenge-context-template.md`
- `templates/challenge/lens-output-template.md`
- `templates/workflow/challenge-summary-template.md`
- `templates/workflow/challenge-disposition-template.md`

Skills / docs to update:

- `skills/challenge/SKILL.md`
- `docs/architecture/2026-04-08-challenge-execution-v0.md`
- `docs/architecture/2026-04-08-challenge-skill-v0.md`

## 10. Stage Transition Contract Upgrade

The transition contract should recognize two human approval gates.

New handoffs:

```text
cmon:challenge(mode=design) -> human_design_approval
human_design_approval -> cmon:plan
cmon:challenge(mode=package) -> human_package_approval
human_package_approval -> cmon:work
```

`proceed` from challenge means:

- ready for human approval

It does not mean:

- ready to skip human approval and start the next agent stage

Files to update:

- `docs/architecture/2026-04-07-stage-transition-contract-v0.md`
- `templates/workflow/stage-transition-decision-template.md`

## 11. Expected Benefits

This change should improve:

- human control over major product and implementation decisions
- design readability and reviewability
- challenge auditability
- long-running agent execution reliability
- work progress tracking across sessions

## 12. Risks

Potential costs:

- more artifacts
- more ceremony for small tasks
- possible confusion if human approval gates are required too broadly
- JSON state drift if `cmon:work` updates chat but not the file

Mitigation:

- apply the full chain primarily to substantial, greenfield, user-facing, stateful, or long-running work
- allow smaller tasks to skip design only when design triggers are explicitly not met
- keep execution JSON mandatory for every `cmon:plan`, including one-task plans, so `cmon:work` has one consistent progress ledger

## 13. Implementation Plan

### Phase 1: Challenge Modes And Approval Gates

- add `Challenge Mode` to challenge templates
- add human design approval template
- add human package approval template
- update stage transition contract
- update `cmon:challenge`

### Phase 2: Design Artifact Upgrade

- expand design spec template
- document diagram/table expectations
- update `cmon:design`

### Phase 3: Plan Execution JSON

- add execution JSON template
- require Markdown plan + execution JSON for every plan
- update `cmon:plan`

### Phase 4: Work Consumes Execution JSON

- update work run manifest
- update unit execution report
- update checkpoint template
- update `cmon:work`

### Phase 5: Consistency Sweep

- update core skill overview
- update routing matrix
- update artifact template overview
- update README if needed

## 14. Implementation Notes

Implemented surfaces:

- `cmon:challenge` now requires `mode=design` or `mode=package`
- design and package challenge prompts are mode-specific
- `human_design_approval` and `human_package_approval` templates live under `templates/workflow/`
- approval artifacts are stored under `docs/approvals/`
- `cmon:plan` requires Markdown plan plus execution JSON
- `cmon:work` consumes and updates execution JSON task state
- core workflow docs now include both human approval gates

## 15. Open Questions

1. Should execution JSON be mandatory for all substantial work, or only for long-running / multi-task work?
   - Decision: execution JSON is mandatory for every `cmon:plan`, including one-task plans.
   - Rationale: acceptance criteria, implementation status, and progress tracking are still useful even when the graph is small.

2. Should human approval be stored under `docs/architecture/`, `docs/plans/`, or a new `docs/approvals/` directory?
   - Decision: use a new dedicated `docs/approvals/` directory.
   - Rationale: approval is a decision artifact, not part of the design or plan itself.

3. Should `human_design_approval` and `human_package_approval` be templates only, or should they eventually become lightweight skills?
   - Decision: they are conceptual stages, not skills.
   - Rationale: approval belongs to the human operator; `cmon` only records the decision artifact.

4. Should `cmon:challenge(mode=design)` use the same challenger prompts as `mode=package`, or should each lens prompt include mode-specific sections?
   - Decision: use different mode-specific prompts.
   - Rationale: design challenge and package challenge ask different questions and reflect different ownership patterns. Design is more product-owned; plan/package review is more engineering-owned.
