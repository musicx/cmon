# cmon Repo Foundation Gate v0

Date: 2026-04-08
Status: Draft

This document records one dogfooding correction to `cmon`:

- greenfield project work should not proceed through the main workflow without first confirming repo foundation state

## Problem

A real `cmon` run produced a new project directory and substantial durable artifacts, but the directory was never initialized as a git repository.

This caused two problems:

- no reliable diff boundary for later review and verification
- no durable versioned trail for plans, designs, and implementation work

That is not acceptable for non-trivial project creation.

## Decision

For greenfield or newly created project directories, `cmon` should treat repo foundation as a real workflow concern in two places:

- `cmon:understand` should discover it early and may initialize git immediately when the target is clearly a new substantial project
- `cmon:work` must re-check it before any real development starts and should not proceed without a git repo

At minimum, it must determine:

- whether the target directory already exists
- whether it is already a git repository
- whether the task is substantial enough that durable artifacts and code changes should be versioned from the start

If the target directory is not a git repository and the task is substantial, the workflow should not silently continue as if repo state did not matter.

## Default Policy

Treat the following as effectively mandatory for new non-trivial project work:

- initialize git before durable artifact production expands
- establish the repo root before design, plan, and implementation accumulate

This is a foundation check, not a late cleanup task.

## Placement

This check should be enforced in two different ways:

- early recovery and optional initialization in `cmon:understand`
- mandatory execution-time enforcement in `cmon:work`

Reason:

- `understand` is still the right place to notice repo foundation early
- `work` is the last reliable place to stop unsafe execution before edits begin
- `pressure-test` should stay focused on artifact readiness, not environment bootstrapping

## Related

- `docs/architecture/2026-04-07-understand-execution-v0.md`
- `docs/architecture/2026-04-07-work-execution-v0.md`
- `docs/architecture/2026-04-08-worktree-skill-v0.md`
