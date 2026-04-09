# cmon Challenge Execution v0

Date: 2026-04-08
Status: Draft

This document defines the manual-first execution shape for `cmon:challenge`.

## 1. Purpose

`cmon:challenge` exists to stress-test the proposed solution before human approval and implementation starts.

It reuses the strongest part of the earlier multi-role review idea:

- product challenge
- engineering challenge
- operations challenge

But it applies that challenge to design artifacts and design+plan packages, not to completed code.

It should preserve the best operational behaviors from the older review surface:

- structured findings
- scope verdict
- conservative synthesis

## 2. Inputs

Default inputs:

- requirements artifact when relevant
- design artifact when one exists
- implementation plan when one exists
- execution JSON when `mode=package`
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

- whether the challenge mode is `design` or `package`
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

The goal is to expose what still looks weak before the corresponding human approval gate.

Use:

- `agents/challenge/design/...` when `mode=design`
- `agents/challenge/package/...` when `mode=package`
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

- `proceed -> human_design_approval` for `mode=design`
- `proceed -> human_package_approval` for `mode=package`
- `revise -> cmon:design`
- `revise -> cmon:plan`
- `block`

Interpretation:

- `revise` is the normal answer when the challenged package is directionally right but still weak
- `block` means implementation must not start yet; it normally forces an upstream reroute rather than ending the overall task
- `proceed` means "ready to ask the user", not "approved"

If `proceed`, the agent may create an approval request artifact with `Status: pending_user_approval`.
The agent must then stop and ask the user to approve, request changes, reject, or waive the gate.
The agent must not set `approved` or `waived_by_user` unless the current conversation already contains explicit user approval or waiver for the challenged artifact.

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
