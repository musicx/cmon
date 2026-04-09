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
- current git status

Then create:

- `templates/verify/verify-run-manifest-template.md`
- `templates/verify/hard-stop-checklist-template.md`
- `templates/verify/specialist-escalation-template.md`

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

## 4. Step 3: Classify Verification Depth

Choose:

- `quick`
- `standard`
- `deep`

Use risk and proof burden, not only diff size.

## 5. Step 4: Run the Hard-Stop Checklist

Use:

- `templates/verify/hard-stop-checklist-template.md`

If any hard stop fails:

- do not accept the unit
- route back to `cmon:work`

## 6. Step 5: Record Specialist Escalation

Use:

- `templates/verify/specialist-escalation-template.md`

Record whether the unit needs:

- security scrutiny
- reliability scrutiny
- performance scrutiny
- contract scrutiny

## 7. Step 6: Write the Verification Summary

Use:

- `templates/verify/verification-summary-template.md`

The summary should state:

- what was verified
- what evidence was used
- what verification depth was used
- whether any hard stops blocked acceptance
- whether specialist scrutiny is still required
- whether a commit was created or why commit is blocked
- what remains unproven
- whether the unit is accepted or needs more work

## 8. Step 7: Commit Accepted Work

If the unit is accepted:

1. Run `git status`.
2. Stage only the accepted unit's intended files.
3. Create a git commit for the accepted unit.
4. Record commit hash and subject in the verification summary.

If committing is unsafe or impossible, record the blocker in the verification summary.

Valid blockers:

- user decision to delay commit
- unrelated dirty worktree
- missing git repo
- failing verification
- scope mismatch

Do not proceed as if verification is complete without a commit hash or explicit blocker.

## 9. Step 8: Route

Use:

- `templates/workflow/stage-transition-decision-template.md`

Default next steps:

- `proceed -> cmon:compound`
- `revise -> cmon:work`
