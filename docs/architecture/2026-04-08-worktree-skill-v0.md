# cmon Worktree Skill v0

Date: 2026-04-08
Status: Draft

This document defines the initial design for `cmon:worktree`.

## Purpose

`cmon:worktree` exists to provide a narrow branch and worktree isolation surface for `cmon`.

It is not part of the canonical build lifecycle.

It is an auxiliary operational skill that helps preserve execution boundaries in situations where a shared working tree would make the workflow less trustworthy.

## Why This Exists

Several reference repos independently add a worktree or branch-isolation layer:

- `superpowers`
- `compound-engineering`
- `gsd-2`

That convergence is not accidental.

They are all solving versions of the same problem:

- shared worktrees make task boundaries blur
- parallel work becomes harder to isolate
- review diffs become noisier
- context pollution makes agent execution less reliable

So the real value is not "git cleverness."

The value is workflow isolation.

## What the Reference Repos Do Differently

### `superpowers`

Primary emphasis:

- safety checks
- directory selection discipline
- baseline setup
- baseline test verification

Meaning:

- worktree setup is treated as part of disciplined execution entry

### `compound-engineering`

Primary emphasis:

- practical daily utility
- create / list / switch / cleanup
- environment portability conveniences
- review and work integration

Meaning:

- worktree handling is a reusable operator-facing utility surface

### `gsd-2`

Primary emphasis:

- runtime policy
- milestone branch isolation
- automatic create / merge / cleanup
- orchestration-level state management

Meaning:

- worktree handling is part of the execution engine, not just a user-invoked skill

### `Waza`

No strong equivalent surface appears in the current repo.

Meaning:

- this layer is intentionally omitted in favor of lighter habits

## cmon Design Choice

`cmon` should absorb the value of worktree isolation, but not the heaviest forms of implementation.

The v0 choice is:

- absorb `superpowers` style safety and boundary logic
- absorb `compound-engineering` style explicit reusable skill shape
- do not absorb `gsd-2` runtime automation

## What `cmon:worktree` Should Do

`cmon:worktree` should answer:

1. should this task stay on the current branch
2. should it move to a new branch in the current worktree
3. should it use a dedicated git worktree
4. what minimal safety checks should happen first
5. what cleanup expectation should be recorded

## What `cmon:worktree` Should Not Do

It should not:

- become a runtime scheduler
- auto-merge branches
- auto-copy secrets or environment files by default
- auto-trust dev tools such as direnv or mise
- become a deploy or ship workflow

Those choices may be useful in some repos, but they are too opinionated and environment-specific for early `cmon`.

## When `cmon:worktree` Is Worth Using

Recommended when:

- `cmon:work` will touch risky or cross-cutting areas
- a review pass should happen against an isolated diff
- debugging or fix work should be isolated from unrelated in-progress work
- more than one implementation stream may proceed in parallel
- the current branch is already carrying unrelated changes

Usually skip when:

- the change is tiny and already isolated
- the current branch is intentionally dedicated to this one bounded unit
- the operational overhead would clearly exceed the isolation value

## v0 Operating Model

The first version should stay narrow:

1. assess isolation need
2. choose one mode:
   - `stay`
   - `branch`
   - `worktree`
3. run minimal safety checks
4. record the decision
5. hand back to the invoking workflow

This makes it an isolation decision skill, not a full git management suite.

## Initial Safety Checks

The v0 skill should focus on a few checks only:

- confirm the current tree is understood before branching or worktree creation
- prefer a consistent worktree directory convention
- ensure project-local worktree directories are ignored
- avoid destructive cleanup
- avoid assuming the repo safely supports worktrees when it has not yet been verified

## Relationship to Existing cmon Skills

### `cmon:work`

`cmon:work` is the most likely direct consumer.

It may invoke `cmon:worktree` when bounded execution would be safer in isolation.

### `cmon:review`

`cmon:review` can benefit indirectly because isolated worktrees tend to produce cleaner diffs and clearer scope boundaries.

### `cmon:pressure-test`

`cmon:pressure-test` may recommend isolation as a readiness condition, but it should not replace `cmon:worktree`.

## Initial Decision

Add `cmon:worktree` as an auxiliary skill.

Reason:

- worktree and branch isolation recur across major reference repos
- the capability is operationally useful without changing the core lifecycle
- a narrow implementation can improve boundary quality without moving `cmon` toward runtime-heavy orchestration

## Related

- `docs/architecture/2026-04-08-shared-extra-capabilities-across-skill-repos-v0.md`
- `docs/architecture/2026-04-07-auxiliary-skill-invocation-policy-v0.md`
- `docs/architecture/2026-04-07-core-skills-v0.md`
