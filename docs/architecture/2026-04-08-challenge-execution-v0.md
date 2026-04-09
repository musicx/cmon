# cmon Challenge Execution v0

Date: 2026-04-08
Status: Draft

This document defines the manual-first execution shape for `cmon:challenge`.

## 1. Purpose

`cmon:challenge` exists to stress-test the proposed solution before implementation starts.

It reuses the strongest part of the earlier multi-role review idea:

- product challenge
- engineering challenge
- operations challenge

But it applies that challenge to design and plan artifacts, not to completed code.

It should preserve the best operational behaviors from the older review surface:

- structured findings
- scope verdict
- conservative synthesis

## 2. Inputs

Default inputs:

- requirements artifact when relevant
- design artifact when one exists
- implementation plan when one exists
- understand packet when local repo context materially affects the proposal

Use:

- `templates/workflow/challenge-run-manifest-template.md`
- `templates/challenge/challenge-context-template.md`
- `templates/challenge/lens-invocation-template.md`
- `templates/challenge/lens-output-template.md`
- `templates/challenge/synthesizer-input-template.md`

## 3. Execution Stages

### Stage 1: Lock The Challenge Target

Record:

- whether the challenge target is design, plan, or combined design-plus-plan
- what next stage is desired
- what risks or questions motivated the challenge pass

### Stage 2: Build Shared Challenge Context

Assemble:

- requirements summary
- design summary when present
- plan summary when present
- understand packet summary when relevant
- explicit open risks

Capture the bundle using:

- `templates/challenge/challenge-context-template.md`

### Stage 3: Run Multi-Role Challenge

Challenge the target through:

- product lens
- engineering lens
- operations lens

The goal is not to duplicate authorship.

The goal is to expose what still looks weak before implementation begins.

Use:

- `agents/challenge/product-challenger.md`
- `agents/challenge/engineering-challenger.md`
- `agents/challenge/ops-challenger.md`
- `templates/challenge/lens-invocation-template.md`

Each challenger should emit structured findings rather than a loose paragraph summary.

Write each challenger's output as a durable artifact rather than leaving it only in chat context.

At minimum, each challenger should contribute:

- scope verdict
- finding title
- severity
- action class
- owner
- confidence
- evidence
- recommended revision

### Stage 4: Merge The Challenge Result

Use:

- `templates/workflow/challenge-summary-template.md`
- `templates/workflow/challenge-disposition-template.md`
- `templates/challenge/synthesizer-input-template.md`
- `templates/workflow/stage-transition-decision-template.md`

Synthesis should:

- deduplicate by issue, not wording
- keep the more conservative severity on disagreement
- preserve lens-specific reasoning
- emit one merged routing decision

Use:

- `agents/challenge/challenge-synthesizer.md`

Return one of:

- `proceed`
- `revise`
- `block`

### Stage 5: Record Finding Disposition

After synthesis, explicitly record what happened to each material finding:

- accepted and routed to `cmon:design`
- accepted and routed to `cmon:plan`
- deferred with reason
- rejected with reason

Do not rely on the transition decision alone to imply how findings were handled.

### Stage 6: Route

Typical routes:

- `proceed -> cmon:work`
- `revise -> cmon:design`
- `revise -> cmon:plan`
- `block`

Interpretation:

- `revise` is the normal answer when the challenged package is directionally right but still weak
- `block` means implementation must not start yet; it normally forces an upstream reroute rather than ending the overall task

## 4. Policy Choice

`cmon:challenge` is now the explicit pre-work gate.

It should stay narrow:

- artifact challenge only
- no code mutation
- no post-work verification role
- but it should still inherit the strongest structured-finding and conservative-merge behavior from the earlier multi-role review surface
- and it should leave a durable audit trail that lets an operator inspect:
  - what each lens said
  - what the merged finding set was
  - how each material issue was ultimately handled
