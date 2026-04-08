# cmon Verify Execution v0

Date: 2026-04-08
Status: Draft

This document turns `cmon:verify` into a manual-first post-work stage.

## 1. Purpose

`cmon:verify` exists to answer one narrow question:

- does the evidence produced by `cmon:work` actually justify accepting the implemented unit

It is not a planning gate and not a broad review surface.

## 2. Inputs

Default inputs:

- work execution report
- verification evidence from work
- system interaction check when relevant
- scope expansion request when relevant
- approved plan and design references when needed for claim interpretation

Use:

- `templates/verify/verify-run-manifest-template.md`

## 3. Execution Stages

### Stage 1: Lock Verification Scope

Record:

- unit under verification
- execution artifacts available
- exact claim being verified

### Stage 2: Inspect Evidence Quality

Check:

- is the evidence fresh
- does it actually test the claimed behavior
- are non-local effects covered when they matter
- are obvious gaps still visible

### Stage 3: Judge Verification Sufficiency

Return one of:

- sufficient
- insufficient but correctable inside work
- insufficient and high-risk enough to justify broader review

### Stage 4: Route

Use:

- `templates/workflow/stage-transition-decision-template.md`

Typical routes:

- `proceed -> cmon:compound`
- `revise -> cmon:work`
- `proceed -> cmon:review`

## 4. Policy Choice

`cmon:verify` is the default post-work acceptance gate.

It is intentionally lighter than `cmon:review`.
