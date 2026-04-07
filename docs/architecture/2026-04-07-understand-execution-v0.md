# cmon Understand Execution v0

Date: 2026-04-07
Status: Draft

This document turns `cmon:understand` into a multi-role context recovery flow.

## 1. Purpose

`cmon:understand` exists to recover verified context before later stages invent around gaps.

It should produce one concise context packet, not a giant repo survey.

## 2. Execution Stages

### Stage 1: Determine Understanding Scope

Use:

- the task request
- explicit paths if provided
- `templates/understand/understand-run-manifest-template.md` when operator control is needed

### Stage 2: Gather Shared Context

Assemble:

- relevant docs
- relevant code areas
- known constraints
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

### Stage 5: Route To Next Skill

The synthesizer should recommend one of:

- `cmon:brainstorm`
- `cmon:plan`
- `cmon:review`

## 3. v0 Policy Choice

`cmon:understand` is intentionally light.

It is not:

- a full architecture audit
- a planning pass
- a broad code review

It should recover only the context needed for the next skill.

## 4. Why This Matches cmon

This keeps your required role separation early in the workflow:

- product
- engineering
- operations

without turning every understanding pass into a heavyweight research project.

## 5. Next Step

This execution doc now has a matching manual operating procedure:

- `docs/architecture/2026-04-07-understand-operating-procedure-v0.md`

It is also exercised by this end-to-end example:

- `docs/architecture/2026-04-07-e2e-example-core-skill-routing-matrix.md`

The next useful upgrade after this document is:

- a second example where `cmon:understand` routes directly to `cmon:plan` or `cmon:review`
