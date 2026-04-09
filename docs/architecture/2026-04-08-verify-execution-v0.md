# cmon Verify Execution v0

Date: 2026-04-08
Status: Draft

This document turns `cmon:verify` into a manual-first post-work stage.

## 1. Purpose

`cmon:verify` exists to answer one narrow question:

- does the evidence produced by `cmon:work` actually justify accepting the implemented unit
- has the accepted implementation unit been committed or is commit explicitly blocked

It is not a planning gate and not a broad review surface.

## 2. Inputs

Default inputs:

- work execution report
- verification evidence from work
- system interaction check when relevant
- scope expansion request when relevant
- approved plan and design references when needed for claim interpretation
- git status and current commit state

Use:

- `templates/verify/verify-run-manifest-template.md`
- `templates/verify/hard-stop-checklist-template.md`
- `templates/verify/specialist-escalation-template.md`

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

### Stage 3: Classify Verification Depth

Classify the pass as:

- `quick`
- `standard`
- `deep`

Use risk and proof burden, not only line count.

### Stage 4: Run Hard-Stop Check

Record the hard-stop checklist:

- fresh evidence
- claim / evidence match
- approved source truth present
- plan / design alignment preserved
- system interaction proof when needed
- regression proof when needed
- risk-sensitive scrutiny when needed

If any hard stop fails:

- do not accept the unit
- route back to `cmon:work`

### Stage 5: Decide Specialist Escalation

Record whether specialist scrutiny is needed for:

- security
- reliability
- performance
- contract-sensitive behavior

This may stay manual in v0, but it should be made explicit.

### Stage 6: Judge Verification Sufficiency

Return one of:

- sufficient
- insufficient but correctable inside work

### Stage 7: Commit Accepted Unit

If the unit is accepted:

- run `git status`
- stage only the accepted unit's intended files
- create a commit for the accepted unit
- record the commit hash and subject in `templates/verify/verification-summary-template.md`

If the unit cannot be committed:

- record the blocker explicitly
- do not treat the verify pass as complete without a commit hash or blocker

Valid blockers include:

- user decision to delay commit
- unrelated dirty worktree that prevents safe staging
- missing git repo
- failing verification
- scope mismatch

### Stage 8: Route

Use:

- `templates/workflow/stage-transition-decision-template.md`

Typical routes:

- `proceed -> cmon:compound`
- `revise -> cmon:work`

Interpretation:

- `proceed -> cmon:compound` requires either a commit hash or an explicit commit blocker
- `revise -> cmon:work` is the default post-work reflow
- if `cmon:work` discovers the mismatch is structural rather than local, the workflow should continue rerouting upstream to `cmon:plan` or `cmon:design`

## 4. Policy Choice

`cmon:verify` is the default post-work engineering acceptance gate.

It should stay focused on implemented code, evidence, and engineering quality.

It should also:

- scale scrutiny with risk
- stop on hard failures instead of softening them into vague concerns
