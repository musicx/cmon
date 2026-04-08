# cmon Design Execution v0

Date: 2026-04-07
Status: Draft

This document turns `cmon:design` from a stage definition into an executable owner-led flow.

## 1. Purpose

`cmon:design` exists to make behavior, flow, state, and boundary truth explicit before planning starts.

This execution layer adds the missing operational pattern:

- one owner drafts
- non-owner lenses challenge
- a merged decision determines whether planning may begin

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

### Stage 3: Dispatch Non-Owner Challenge

Run the non-owner challenge lenses for this draft.

Typical combinations:

- for `product-led`: `engineering` and `operations`
- for `engineering-led`: `product` and `operations`

Optional full triad challenge is allowed when the work is large or risky.

Challenge prompts:

- `agents/design/product-challenger.md`
- `agents/design/engineering-challenger.md`
- `agents/design/ops-challenger.md`

Wrap each call with:

- `templates/design/challenge-invocation-template.md`

### Stage 4: Synthesize The Challenge Output

Pass the design draft and all challenge outputs into:

- `agents/design/design-synthesizer.md`

Use:

- `templates/design/design-synthesizer-input-template.md`

### Stage 5: Revise The Design Artifact

If the challenge decision is `revise`:

- update the design artifact
- run the relevant challenge lenses again

Do not hand unresolved design ambiguity to planning just because the draft is "close enough".

### Stage 6: Route To Next Skill

Use:

- `templates/workflow/stage-transition-decision-template.md`

If planning readiness is `ready`:

- `proceed -> cmon:plan`

If the decision is `revise`:

- `revise -> cmon:design`

If upstream instability prevents responsible design closure:

- `block`

## 3. v0 Policy Choice

`cmon:design` is owner-led, not symmetric co-authoring.

That means:

- the owner drafts the artifact
- challengers pressure-test the draft
- the synthesizer decides whether planning may begin

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
