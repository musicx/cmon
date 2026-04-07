# cmon Artifact Templates v0

Date: 2026-04-07
Status: Draft

This document defines the first artifact templates for `cmon`.

These templates are intentionally influenced by:

- `superpowers` for explicit structure and execution boundaries
- `compound-engineering` for durable artifacts and reusable knowledge capture

They are not direct copies.

`cmon` keeps them smaller and more constraint-oriented.

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

### Brainstorm

Path:

- `templates/brainstorm/requirements-template.md`
- `templates/brainstorm/brainstorm-run-manifest-template.md`
- `templates/brainstorm/brainstorm-context-template.md`
- `templates/brainstorm/lens-invocation-template.md`
- `templates/brainstorm/synthesizer-input-template.md`

Used by:

- `cmon:brainstorm`

Purpose:

- turn an explored problem into an approved requirements/design artifact
- keep multi-lens brainstorming inputs and synthesis consistent

Key sections:

- problem frame
- intended outcome
- requirements with stable IDs
- success criteria
- scope boundaries
- key decisions
- blocking and deferred questions

### Plan

Path:

- `templates/plans/implementation-plan-template.md`

Used by:

- `cmon:plan`

Purpose:

- turn approved intent into a bounded implementation plan

Key sections:

- requirements trace
- scope boundaries
- existing patterns and constraints
- technical decisions
- implementation units
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
- create a clean handoff package for review

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

### Review

Paths:

- `templates/review/reviewer-context-template.md`
- `templates/review/lens-reviewer-invocation-template.md`
- `templates/review/synthesizer-input-template.md`
- `templates/review/review-run-manifest-template.md`

Used by:

- `cmon:review`

Purpose:

- keep multi-lens review inputs consistent
- prevent reviewer drift across product, engineering, and operations lenses
- give synthesis a stable merged-input shape
- give the review helper one explicit invocation contract

## 2. Design Choices

### Why requirements and plan are separate

This follows the `compound-engineering` split between:

- what should be built
- how it should be implemented

`cmon` keeps this separation because it reduces hidden product invention during planning.

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
- bounded implementation planning
- bounded unit execution
- trigger-based knowledge capture
- reusable knowledge capture
- multi-lens review dispatch and synthesis

So the template layer is sufficient for a v0 end-to-end document flow.

## 5. Immediate Next Step

The next useful addition after templates is:

- a lightweight helper that assembles and routes review templates automatically
- a second end-to-end example that exercises multi-file work
- an end-to-end example that proves the chain all the way through `cmon:compound`
