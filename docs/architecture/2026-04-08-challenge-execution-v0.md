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

## 2. Inputs

Default inputs:

- requirements artifact when relevant
- design artifact when one exists
- implementation plan when one exists
- understand packet when local repo context materially affects the proposal

Use:

- `templates/workflow/challenge-run-manifest-template.md`

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

### Stage 3: Run Multi-Role Challenge

Challenge the target through:

- product lens
- engineering lens
- operations lens

The goal is not to duplicate authorship.

The goal is to expose what still looks weak before implementation begins.

### Stage 4: Merge The Challenge Result

Use:

- `templates/workflow/challenge-summary-template.md`
- `templates/workflow/stage-transition-decision-template.md`

Return one of:

- `proceed`
- `revise`
- `block`

### Stage 5: Route

Typical routes:

- `proceed -> cmon:work`
- `revise -> cmon:design`
- `revise -> cmon:plan`
- `block`

## 4. Policy Choice

`cmon:challenge` is now the explicit pre-work gate.

It should stay narrow:

- artifact challenge only
- no code mutation
- no post-work verification role

