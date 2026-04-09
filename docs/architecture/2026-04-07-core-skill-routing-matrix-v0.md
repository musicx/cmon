# cmon Core Skill Routing Matrix v0

Date: 2026-04-07
Status: Draft

This document is a compact operator-facing routing reference for the current core `cmon` skills.

It exists so an operator can answer three questions quickly:

1. which skill should run next
2. what that skill requires
3. what artifact or decision it should produce

## Default Lifecycle

```text
cmon:understand -> cmon:think -> cmon:design -> cmon:challenge(mode=design) -> human_design_approval -> cmon:plan -> cmon:challenge(mode=package) -> human_package_approval -> cmon:work -> cmon:verify -> cmon:compound
```

Not every task needs the full chain, but substantial work should start from this model.
The two human approval gates are conceptual stages recorded in `docs/approvals/`, not standalone skills.

## Routing Matrix

| Skill | Use When | Requires | Produces | Do Not Use It For | Normal Next Step |
|---|---|---|---|---|---|
| `cmon:understand` | Repo area, prior decisions, or constraints are not fully loaded | Task summary and a repo area or permission to infer it | Context packet: relevant area, artifacts, patterns, constraints, open questions | Planning, implementation, or pre-work challenge itself | `cmon:think`, `cmon:design`, or `cmon:plan` |
| `cmon:think` | Problem framing, candidate directions, scope, or approach is still open | Understand packet or equivalent context | Either a ranked direction set or approved requirements with blockers made explicit and recommendation recorded | Code, implementation steps, or vague "we'll figure it out later" plans | stay in `cmon:think`, `cmon:design`, or `cmon:plan` depending on mode outcome, but default to `cmon:design` for greenfield or new product-surface work |
| `cmon:design` | Flow, state, UX, interface, or boundary design is still ambiguous, or the work is greenfield / introduces a new user-facing or operator-facing surface | Approved requirements artifact | Human-reviewable design spec with flows, states, boundary decisions, interaction model, diagrams/tables when useful, and planning blockers made explicit | Exact file mapping or implementation sequencing | `cmon:challenge(mode=design)` |
| `cmon:challenge(mode=design)` | A design artifact should be challenged before human design approval | Requirements artifact, design artifact, and understand packet when local context matters | Product/engineering/operations design challenge findings plus proceed / revise / block decision | Implementation plan review, completed-code review, or replacing human approval | `human_design_approval`, `cmon:design`, or upstream block |
| `human_design_approval` | AI challenge has passed and the human must decide whether planning may begin | Design artifact and design challenge summary/disposition | Approval artifact in `docs/approvals/` | Replacing AI challenge or implementation planning | `cmon:plan` or `cmon:design` |
| `cmon:plan` | Human-approved design and approved intent exist and implementation needs bounded units | Requirements artifact, human-approved design artifact when required, and relevant local context | Markdown implementation plan plus required execution JSON with units, dependencies, boundaries, verification, acceptance criteria, and status fields | Brainstorming, design exploration, free-form coding, or direct work handoff | stay in `cmon:plan` until Markdown and JSON are aligned, then `cmon:challenge(mode=package)` |
| `cmon:challenge(mode=package)` | Approved design, Markdown plan, and execution JSON should be challenged before human package approval | Requirements artifact, approved design artifact, Markdown plan, execution JSON, and understand packet when local context matters | Product/engineering/operations package challenge findings plus proceed / revise / block decision | Reviewing completed code or replacing `cmon:verify` | `human_package_approval`, `cmon:plan`, `cmon:design`, or upstream block |
| `human_package_approval` | Package challenge has passed and the human must decide whether implementation may begin | Approved design, Markdown plan, execution JSON, and package challenge summary/disposition | Approval artifact in `docs/approvals/` | Replacing package challenge or doing implementation | `cmon:work`, `cmon:plan`, or `cmon:design` |
| `cmon:work` | One approved implementation unit is ready to execute | Human-approved package, plan unit, execution JSON task id, file scope, constraints, execution strategy, verification target, stop condition, system interaction trigger check when relevant, a valid git-backed repo root before edits begin, and an explicit isolation decision when the workspace is risky or noisy | Code, tests, execution JSON status/evidence updates, verification evidence, delegated packet when needed, unit checkpoint when needed, execution artifacts, system interaction result when relevant, internal review loop outputs, verify-ready report | Unbounded implementation or silent scope expansion | `cmon:verify`, then reflow upstream only if structural mismatch is discovered |
| `cmon:verify` | A completed implementation unit needs engineering acceptance before it is treated as done | Diff when needed, approved design/plan references, work report, fresh verification evidence, and system interaction check when relevant | Verification judgment covering plan alignment, evidence sufficiency, correctness, safety, effectiveness, and simplicity | Re-running pre-work challenge or broader problem framing | `cmon:compound` or back to `cmon:work` |
| `cmon:compound` | The work created reusable learning worth preserving | Accepted work outcome plus a real lesson, guardrail, or recurring pattern | Durable solution, pattern, or guardrail artifact | Logging every trivial edit | Loop complete |

## Skill Entry Checks

### Before `cmon:challenge(mode=design)`

Make sure:

- the design artifact exists
- the artifact is written for human review, not only agent execution
- the intended behavior, flows, states, interaction model, boundaries, and planning blockers are explicit
- diagrams, tables, or graphs are used where they materially improve auditability

If not, go back to:

- `cmon:design`

### Before `human_design_approval`

Make sure:

- `cmon:challenge(mode=design)` produced a proceed decision
- all accepted design findings have been resolved or explicitly deferred with rationale
- the approval artifact path in `docs/approvals/` is known

If not, go back to:

- `cmon:design`

### Before `cmon:plan`

Make sure:

- the intended behavior is already clear
- the design artifact has human approval when design was required
- scope boundaries are explicit
- success criteria are concrete

If not, go back to:

- `cmon:think`
- `cmon:design`

### Before `cmon:challenge(mode=package)`

Make sure:

- the approved design artifact exists when design ambiguity mattered
- the Markdown implementation plan exists
- the execution JSON exists and matches the Markdown plan
- the artifact package is specific enough to challenge rather than still being raw planning
- the desired next step is human package approval

### Before `cmon:work`

Make sure:

- exactly one implementation unit is being executed
- the design / plan / execution JSON package already survived `cmon:challenge(mode=package)`
- the human package approval exists in `docs/approvals/`
- the execution JSON task id is known and ready to mark `in_progress`
- file scope is explicit
- execution strategy is chosen
- verification is named before editing starts
- system interaction triggers have been considered
- the target project area is already a git repo before real development begins

If not, go back to:

- `cmon:plan`
- or initialize git first for substantial greenfield work

### Before `cmon:verify`

Make sure:

- a meaningful unit actually changed
- verification evidence exists from the current session
- internal review loop has already passed
- a verification claim is explicit
- requirements/design and plan references are available when they exist

If not, go back to:

- `cmon:work`

## Why This Document Exists

`cmon` is intentionally more constrained than a generic prompting toolkit.

That only works if the operator can see:

- where each skill begins
- where each skill must stop
- what artifact or decision the skill owes the next stage

This matrix is the shortest durable reference for that boundary model.
