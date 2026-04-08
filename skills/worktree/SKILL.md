---
name: cmon:worktree
description: Use when you need to decide whether bounded work should stay on the current branch, move to a new branch, or run inside a dedicated git worktree with minimal safety checks.
---

# cmon:worktree

Use isolation deliberately.

`cmon:worktree` exists to keep branch and workspace decisions from becoming ad hoc.

This is an auxiliary workflow skill.

## When to Use

Use this skill when one or more of these are true:

- the current branch already carries unrelated work
- the next implementation unit is risky enough that it should be isolated
- a review pass would be cleaner against an isolated diff
- more than one work stream may proceed in parallel
- a debug or fix pass should not contaminate another in-progress unit

## Non-Goals

Do not use this skill to:

- become a full git automation suite
- auto-merge or auto-land work
- copy secrets or `.env` files by default
- auto-trust local tooling such as `direnv` or `mise`
- replace `cmon:work`

## Core Questions

This skill should answer:

1. should this work stay on the current branch
2. should it move to a new branch in the current tree
3. should it use a dedicated worktree
4. what minimal safety checks are needed first
5. what cleanup expectation should be recorded

## Decision Modes

Choose one:

1. `stay`
   - use the current branch and current working tree
   - only when the current context is already clean and dedicated enough

2. `branch`
   - create or use a dedicated branch in the current working tree
   - use when isolation is useful but a second filesystem workspace is unnecessary

3. `worktree`
   - create or use a dedicated git worktree
   - use when parallel work, risky work, or clean-diff review strongly benefits from filesystem isolation

## Minimal Safety Rules

- Do not assume worktrees are worth the overhead on every task
- Do not create project-local worktree directories unless they are ignored
- Do not perform destructive cleanup by default
- Do not treat worktree creation as a substitute for bounded planning
- Do not silently move work into another branch or worktree without recording the decision

## Output

Report:

- `Isolation decision`
- `Reason`
- `Safety checks run`
- `Target branch or worktree name`
- `Cleanup expectation`

The output should be small and operational.

## Typical Handoffs

Use:

- `templates/workflow/stage-transition-decision-template.md`

Typical transitions:

- `proceed -> cmon:work`
  - when the isolation decision is complete and `cmon:work` preconditions already hold

- `block`
  - when the repo state is not clean enough to make a safe isolation move without user intervention

## Related

- `docs/architecture/2026-04-08-worktree-skill-v0.md`
