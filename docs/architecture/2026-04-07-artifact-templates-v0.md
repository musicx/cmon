# cmon Artifact Templates v0

Date: 2026-04-07
Status: Draft

This document defines the first artifact templates for `cmon`.

These templates are intentionally influenced by:

- `superpowers` for explicit structure and execution boundaries
- `compound-engineering` for durable artifacts and reusable knowledge capture
- `gstack` for design and plan quality gates

They are not direct copies.

`cmon` keeps them smaller and more constraint-oriented.

Shared invocation policy for auxiliary skills is defined in:

- `docs/architecture/2026-04-07-auxiliary-skill-invocation-policy-v0.md`

## 1. Template Set

### Understand

Paths:

- `templates/understand/understand-run-manifest-template.md`
- `templates/understand/understand-context-template.md`
- `templates/understand/lens-invocation-template.md`
- `templates/understand/synthesizer-input-template.md`

Used by:

- `cmon:understand`

Purpose:

- define the scope of one understanding pass
- keep multi-lens repo observation consistent
- produce one shared context packet for the next skill

### Think

Path:

- `templates/think/directions-template.md`
- `templates/think/requirements-template.md`
- `templates/think/think-run-manifest-template.md`
- `templates/think/think-context-template.md`
- `templates/think/lens-invocation-template.md`
- `templates/think/synthesizer-input-template.md`

Used by:

- `cmon:think`

Purpose:

- support the canonical `cmon:think` implementation surface
- turn an explored problem into either a chosen direction or an approved requirements artifact
- keep multi-lens thinking inputs and synthesis consistent

Key sections:

- for direction artifacts:
  - problem frame
  - current status quo
  - candidate directions with smallest credible wedge
  - ranked recommendation
- for requirements artifacts:
  - problem frame
  - intended outcome
  - requirements with stable IDs
  - alternatives and recommendation
  - success criteria
  - scope boundaries
  - key decisions
  - blocking and deferred questions

### Design

Path:

- `templates/design/design-spec-template.md`
- `templates/design/design-run-manifest-template.md`
- `templates/design/challenge-invocation-template.md`
- `templates/design/design-synthesizer-input-template.md`

Used by:

- `cmon:design`

Purpose:

- turn approved requirements into an explicit design artifact
- make flows, states, boundaries, and interaction choices reviewable before planning
- keep design review criteria explicit instead of hiding them inside planning
- support owner-led challenge and approval before planning

Key sections:

- design goals
- flow and state definition
- interface and boundary decisions
- requirements trace
- design quality gate
- owner mode and challenge routing

### Plan

Path:

- `templates/plans/implementation-plan-template.md`
- `templates/plans/plan-run-manifest-template.md`
- `templates/plans/research-summary-template.md`
- `templates/plans/plan-deepening-template.md`

Used by:

- `cmon:plan`

Purpose:

- turn approved intent into a bounded implementation plan
- support planning mode selection, research capture, and deepening passes

Key sections:

- requirements trace
- design trace
- scope boundaries
- existing patterns and constraints
- research notes
- technical decisions
- implementation units
- test scenarios
- execution note
- verification
- review watchpoints

### Work

Paths:

- `templates/work/work-run-manifest-template.md`
- `templates/work/scope-expansion-request-template.md`
- `templates/work/verification-evidence-template.md`
- `templates/work/unit-execution-report-template.md`

Used by:

- `cmon:work`

Purpose:

- lock one implementation unit before editing starts
- record scope expansion rather than letting it hide in chat
- capture fresh verification evidence
- create a clean handoff package for explicit verification
- keep execution traceable back to requirements, design, and plan posture

### Verify

Paths:

- `templates/verify/verify-run-manifest-template.md`
- `templates/verify/verification-summary-template.md`

Used by:

- `cmon:verify`

Purpose:

- judge whether the post-work implementation claim is actually supported by fresh evidence
- check implementation against approved design / plan and engineering quality expectations
- produce an explicit accept / revise verification decision

### Debug

Paths:

- `templates/debug/debug-run-manifest-template.md`
- `templates/debug/debug-report-template.md`

Used by:

- `cmon:debug`

Purpose:

- lock one bounded debugging pass before investigation drifts
- capture reproducibility, evidence, and current hypothesis explicitly
- produce a clean debugging handoff before any fix or reroute

### Solutions

Paths:

- `templates/solutions/bug-solution-template.md`
- `templates/solutions/pattern-solution-template.md`

Used by:

- `cmon:compound`

Purpose:

- preserve reusable bug learnings and reusable patterns separately

### Compound

Paths:

- `templates/compound/compound-run-manifest-template.md`
- `templates/compound/compound-context-template.md`
- `templates/compound/lens-invocation-template.md`
- `templates/compound/synthesizer-input-template.md`
- `templates/compound/trigger-checklist-template.md`

Used by:

- `cmon:compound`

Purpose:

- classify whether compounding is mandatory
- preserve multi-lens learning signals
- support new-doc versus update-existing decisions

- `templates/compound/knowledge-refresh-manifest-template.md`
- `templates/compound/knowledge-refresh-summary-template.md`

Used by:

- `cmon:refresh-knowledge`

Purpose:

- support narrow refresh passes for stale, overlapping, or duplicated knowledge
- keep maintenance evidence-based and scoped

### Legacy Review Compatibility

Paths:

- `templates/review/reviewer-context-template.md`
- `templates/review/lens-reviewer-invocation-template.md`
- `templates/review/synthesizer-input-template.md`
- `templates/review/review-run-manifest-template.md`

Used by:

- deprecated `cmon:review` compatibility flows only

Purpose:

- keep old multi-lens review inputs consistent while legacy examples still exist
- prevent reviewer drift across product, engineering, and operations lenses
- give synthesis a stable merged-input shape
- give the review helper one explicit invocation contract

### Workflow

Paths:

- `templates/workflow/stage-transition-decision-template.md`
- `templates/workflow/challenge-run-manifest-template.md`
- `templates/workflow/challenge-summary-template.md`

Used by:

- all major `cmon:*` stage handoffs

Purpose:

- normalize handoff decisions into `proceed / revise / block`
- make the next stage explicit
- keep missing conditions visible instead of implying readiness
- provide one thin orchestration surface for reusing existing critique stacks

## 2. Design Choices

### Why requirements, design, and plan are separate

This follows the `compound-engineering` split between:

- what should be built
- how it should behave structurally
- how it should be implemented

`cmon` keeps this separation because it reduces hidden product invention during planning and hidden design invention during implementation planning.

### Why the plan template includes implementation units

This is the `superpowers` influence.

`cmon` wants stronger execution boundaries than a purely architectural plan, so the template defines bounded units with:

- files
- constraints
- verification
- done criteria

### Why solution templates split bugs from patterns

Not every reusable lesson is a bug.

The split keeps:

- root-cause-style bug learnings
- reusable guidance or guardrail patterns

from collapsing into one vague "knowledge" bucket.

## 3. Usage Rule

These templates are defaults, not rigid forms.

Allowed:

- omitting clearly irrelevant sections
- compressing small artifacts
- extending sections when the work genuinely needs more detail

Not allowed:

- dropping core boundary sections
- removing requirement IDs from substantial brainstorm artifacts
- writing plans without verification
- writing solution docs that do not state the reusable lesson

## 4. Current Status

The initial template set now covers:

- repo understanding and context recovery
- pre-implementation intent artifacts
- explicit design artifacts
- bounded implementation planning
- bounded unit execution
- trigger-based knowledge capture
- reusable knowledge capture
- multi-lens review dispatch and synthesis

So the template layer is sufficient for a v0.1 end-to-end document flow, including the first operational `cmon:design` challenge flow.

## 5. Immediate Next Step

The next useful addition after templates is:

- a stronger blocked example
