# Verify Commit Requirement v0

Date: 2026-04-09
Status: Implemented

## Problem

Dogfooding `cmon` on `projects/pomodoro-cli` showed that a project can complete multiple `cmon:work` units and generate multiple `cmon:verify` artifacts without ever creating git commits.

That breaks the harness goal:

- completed units are not durably checkpointed
- later review cannot rely on commit boundaries
- recovery after a failed later unit is harder
- generated verification artifacts imply acceptance without version-control evidence

## Decision

Every accepted `cmon:verify` pass must include git commit hygiene.

If `cmon:verify` accepts an implemented unit, it must either:

- create a git commit for that accepted unit and record the commit hash
- or record an explicit commit blocker and the exact next action required

## Why This Belongs In Verify

`cmon:work` should not commit automatically after every implementation attempt because the unit may still fail evidence, spec compliance, or quality review.

`cmon:verify` is the acceptance gate.
That is the first point where the framework can responsibly say:

- this unit is accepted
- these changes belong together
- the accepted state should be persisted as a commit

## Valid Commit Blockers

Valid blockers include:

- user explicitly requests delaying commit
- unrelated dirty worktree prevents safe staging
- repository is not a git repo
- verification failed
- scope mismatch means the unit should return to work or planning

Invalid blockers:

- forgetting to commit
- assuming a later final commit is good enough
- generating a verification markdown file
- saying tests passed without preserving the accepted state

## Required Summary Fields

Verification summaries must record:

- `Git Status Checked`
- `Commit Created`
- `Commit Hash`
- `Commit Subject`
- `Commit Blocker`
- `Commit Blocker Detail`

## Stage Impact

`proceed -> cmon:compound` is valid only when:

- the implementation claim is verified
- hard stops are clear
- required specialist escalation is clear or complete
- a commit hash exists, or a commit blocker is explicitly recorded
