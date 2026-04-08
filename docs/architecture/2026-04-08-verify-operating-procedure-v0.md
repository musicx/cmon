# cmon Verify Operating Procedure v0

Date: 2026-04-08
Status: Draft

This procedure describes how to run one `cmon:verify` pass.

## 1. Inputs

Before starting, collect:

- work execution report
- verification evidence
- system interaction check if one exists
- scope expansion request if one exists

Then create:

- `templates/verify/verify-run-manifest-template.md`

## 2. Step 1: Lock the Verification Claim

Record:

- which unit is being verified
- what exact behavior or completion claim is under judgment
- what evidence will be relied on

## 3. Step 2: Inspect Evidence

Check:

- freshness
- scope alignment
- non-local behavior coverage when needed
- whether the evidence supports the actual claim rather than only a nearby one

## 4. Step 3: Write the Verification Summary

Use:

- `templates/verify/verification-summary-template.md`

The summary should state:

- what was verified
- what evidence was used
- what remains unproven
- whether the unit is accepted, needs more work, or should escalate to review

## 5. Step 4: Route

Use:

- `templates/workflow/stage-transition-decision-template.md`

Default next steps:

- `proceed -> cmon:compound`
- `revise -> cmon:work`
- `proceed -> cmon:review`
