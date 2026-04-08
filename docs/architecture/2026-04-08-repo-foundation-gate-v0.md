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

For greenfield or newly created project directories, `cmon:understand` must explicitly check repo foundation state before later stages proceed.

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

This check belongs in `cmon:understand`.

Reason:

- it is a stage-entry concern
- it affects later routing, worktree use, reviewability, and evidence quality
- it should happen before planning and implementation start depending on git state

## Related

- `docs/architecture/2026-04-07-understand-execution-v0.md`
- `docs/architecture/2026-04-07-understand-operating-procedure-v0.md`
- `docs/architecture/2026-04-08-worktree-skill-v0.md`
