# cmon Understand Execution v0

Date: 2026-04-07
Status: Draft

This document turns `cmon:understand` into a stronger multi-role stage-entry flow.

## 1. Purpose

`cmon:understand` exists to recover verified context before later stages invent around gaps.

It should produce one concise context packet that later stages can actually reuse, not a giant repo survey and not a vague preface.

## 2. Execution Stages

### Stage 1: Determine Understanding Scope

Use:

- the task request
- explicit paths if provided
- `templates/understand/understand-run-manifest-template.md` when operator control is needed

Decide:

- what repo area is likely relevant
- which stage is expected next
- what understanding would be sufficient for that stage to start responsibly

### Stage 2: Gather Shared Context

Assemble:

- repo foundation state
- relevant docs
- relevant code areas
- prior durable artifacts
- prior learnings
- known constraints
- local patterns
- obvious gaps

Use:

- `templates/understand/understand-context-template.md`

### Stage 3: Dispatch Lens Observers

Dispatch in parallel:

- `agents/understand/product-observer.md`
- `agents/understand/engineer-observer.md`
- `agents/understand/ops-observer.md`

Wrap each call with:

- `templates/understand/lens-invocation-template.md`

### Stage 4: Synthesize

Pass the shared context and observer outputs into:

- `agents/understand/understand-synthesizer.md`

Use:

- `templates/understand/synthesizer-input-template.md`

### Stage 5: Validate Packet Quality

Before handoff, validate that the packet includes:

- repo foundation state when the target is a greenfield or newly created project directory
- verified relevant area
- strongest prior artifacts
- reusable local patterns
- constraints that will shape the next stage
- open questions sorted by whether they block the next stage or merely inform it

If the packet cannot support a responsible next-stage start, stay in `cmon:understand` and tighten it.

### Stage 6: Route To Next Skill

Use:

- `templates/workflow/stage-transition-decision-template.md`

The synthesizer should recommend one of:

- `cmon:think`
- `cmon:design`
- `cmon:plan`
- `cmon:review`

## 3. v0 Policy Choice

`cmon:understand` is intentionally bounded, but it is no longer merely light.

It is not:

- a full architecture audit
- a planning pass
- a broad code review

It should recover exactly the context the next skill should trust.

## 4. Why This Matches cmon

This keeps your required role separation early in the workflow:

- product
- engineering
- operations

without turning every understanding pass into a heavyweight research project.

It also absorbs a stronger habit from the reference repos:

- later stages should begin from a shared recovered packet, not from incompatible rediscovery

## 5. Next Step

This execution doc now has a matching manual operating procedure:

- `docs/architecture/2026-04-07-understand-operating-procedure-v0.md`

It is also exercised by this end-to-end example:

- `docs/architecture/2026-04-07-e2e-example-core-skill-routing-matrix.md`

The next useful upgrade after this document is:

- adoption of the shared stage transition contract across the remaining stages
