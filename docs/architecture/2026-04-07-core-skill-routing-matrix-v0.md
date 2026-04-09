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
cmon:understand -> cmon:think -> cmon:design -> cmon:plan -> cmon:challenge -> cmon:work -> cmon:verify -> cmon:compound
```

Not every task needs the full chain, but substantial work should start from this model.

## Routing Matrix

| Skill | Use When | Requires | Produces | Do Not Use It For | Normal Next Step |
|---|---|---|---|---|---|
| `cmon:understand` | Repo area, prior decisions, or constraints are not fully loaded | Task summary and a repo area or permission to infer it | Context packet: relevant area, artifacts, patterns, constraints, open questions | Planning, implementation, or pre-work challenge itself | `cmon:think`, `cmon:design`, or `cmon:plan` |
| `cmon:think` | Problem framing, candidate directions, scope, or approach is still open | Understand packet or equivalent context | Either a ranked direction set or approved requirements with blockers made explicit and recommendation recorded | Code, implementation steps, or vague "we'll figure it out later" plans | stay in `cmon:think`, `cmon:design`, or `cmon:plan` depending on mode outcome, but default to `cmon:design` for greenfield or new product-surface work |
| `cmon:design` | Flow, state, UX, interface, or boundary design is still ambiguous, or the work is greenfield / introduces a new user-facing or operator-facing surface | Approved requirements artifact | Approved design spec with flows, states, boundary decisions, and planning blockers made explicit | Exact file mapping or implementation sequencing | `cmon:plan` |
| `cmon:plan` | Approved intent exists and implementation needs bounded units | Requirements artifact, plus a design artifact whenever the work is greenfield, user-facing, stateful, multi-workflow, or otherwise behavior-shaping | Implementation plan with units, file scope, constraints, patterns, test scenarios, verification, and challenge-ready boundaries when needed | Brainstorming, design exploration, or free-form coding | stay in `cmon:plan` until critique is clear, then `cmon:challenge` |
| `cmon:challenge` | A design, plan, or combined package should be challenged before implementation starts | Requirements artifact when relevant, design artifact when one exists, plan when one exists, and understand packet when local context matters | Product/engineering/operations challenge findings plus a merged proceed / revise / block decision | Reviewing completed code or replacing `cmon:verify` | `cmon:work`, `cmon:design`, or `cmon:plan` |
| `cmon:work` | One approved implementation unit is ready to execute | Plan unit, file scope, constraints, execution strategy, verification target, stop condition, system interaction trigger check when relevant, a valid git-backed repo root before edits begin, and an explicit isolation decision when the workspace is risky or noisy | Code, tests, verification evidence, delegated packet when needed, unit checkpoint when needed, execution artifacts, system interaction result when relevant, internal review loop outputs, verify-ready report | Unbounded implementation or silent scope expansion | `cmon:verify`, then reflow upstream only if structural mismatch is discovered |
| `cmon:verify` | A completed implementation unit needs engineering acceptance before it is treated as done | Diff when needed, approved design/plan references, work report, fresh verification evidence, and system interaction check when relevant | Verification judgment covering plan alignment, evidence sufficiency, correctness, safety, effectiveness, and simplicity | Re-running pre-work challenge or broader problem framing | `cmon:compound` or back to `cmon:work` |
| `cmon:compound` | The work created reusable learning worth preserving | Accepted work outcome plus a real lesson, guardrail, or recurring pattern | Durable solution, pattern, or guardrail artifact | Logging every trivial edit | Loop complete |

## Skill Entry Checks

### Before `cmon:plan`

Make sure:

- the intended behavior is already clear
- the design is explicit enough that planning does not need to invent flow or state behavior
- a design artifact already exists for greenfield work, new user-facing surfaces, persistence/config surfaces, or multi-workflow behavior
- scope boundaries are explicit
- success criteria are concrete

If not, go back to:

- `cmon:think`
- `cmon:design`

### Before `cmon:challenge`

Make sure:

- the relevant design artifact exists when design ambiguity mattered
- the relevant plan exists
- the artifact package is specific enough to challenge rather than still being raw brainstorming
- the desired next step is actually implementation

If not, go back to:

- `cmon:think`
- `cmon:design`
- `cmon:plan`

### Before `cmon:work`

Make sure:

- exactly one implementation unit is being executed
- the design / plan package already survived `cmon:challenge`
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
