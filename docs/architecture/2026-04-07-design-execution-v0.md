# cmon Design Execution v0

Date: 2026-04-07
Status: Draft

This document turns `cmon:design` from a stage definition into an executable owner-led flow.

## 1. Purpose

`cmon:design` exists to make behavior, flow, state, and boundary truth explicit before planning starts.

This stage should be treated as mandatory, not optional, for:

- greenfield projects
- new user-facing CLI, API, UI, or operator-facing surfaces
- work that introduces persistence, config, storage, or multiple workflows
- tasks where planning would otherwise have to invent behavior or boundary truth

This execution layer adds the missing operational pattern:

- one owner drafts
- the design artifact is written for human audit
- `cmon:challenge(mode=design)` performs the multi-role challenge
- human design approval determines whether planning may begin

## 2. Execution Stages

### Stage 1: Determine Owner Mode And Scope

Start from:

- the approved requirements artifact
- the task request
- explicit operator control when needed through `templates/design/design-run-manifest-template.md`

Choose one owner mode:

- `product-led` when the work is mainly about UX, operator flow, or behavior
- `engineering-led` when the work is mainly about interfaces, protocols, or system-boundary behavior

### Stage 2: Draft The Design Artifact

Write the draft using:

- `templates/design/design-spec-template.md`

Owner assist prompts:

- `agents/design/product-designer.md`
- `agents/design/engineering-designer.md`

The owner may also draft directly without a prompt, as long as the artifact shape stays the same.

### Stage 3: Prepare For Design Challenge

The design stage does not run the formal multi-role challenge itself.
Instead, make the draft strong enough to challenge:

- what is being built is clear
- why this shape is chosen is clear
- user/operator interaction is explicit
- diagrams, tables, state models, or graphs are included when they improve reviewability
- remaining blockers are visible

### Stage 4: Route To `cmon:challenge(mode=design)`

Use:

- `templates/workflow/stage-transition-decision-template.md`

If challenge readiness is `ready`:

- `proceed -> cmon:challenge(mode=design)`

If the design artifact is still weak:

- `revise -> cmon:design`

If upstream instability prevents responsible design closure:

- `block`

Do not hand unresolved design ambiguity to `cmon:challenge` just because the draft is "close enough".

## 3. v0 Policy Choice

`cmon:design` is owner-led, not symmetric co-authoring.

That means:

- the owner drafts the artifact
- formal multi-role challenge happens in `cmon:challenge(mode=design)`
- the human approval gate decides whether planning may begin

This keeps multi-role coverage without flattening role accountability.

## 4. What Was Borrowed From Mature Systems

From `superpowers`:

- design may not be skipped before coding

From `compound-engineering`:

- durable upstream artifacts reduce downstream invention

From `gstack`:

- design quality should be challenged before implementation
- revision should continue until the artifact is strong enough

## 5. What cmon Intentionally Does Differently

- no heavy browser or visual runtime
- no symmetric multi-agent design authorship by default
- no mixing of implementation plan detail into the design artifact

## 6. Next Step

This execution doc now has a matching manual operating procedure:

- `docs/architecture/2026-04-07-design-operating-procedure-v0.md`

The next useful upgrade after this document is:

- broader adoption of the shared stage transition contract in operating procedures and examples
