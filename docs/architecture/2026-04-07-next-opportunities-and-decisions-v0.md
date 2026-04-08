# cmon Next Opportunities and Decisions v0

Date: 2026-04-07
Status: Draft

This document records the next meaningful opportunities for `cmon` after the current v1 workflow proof set.

It is based on:

- the original `cmon` design intent
- the currently implemented `cmon` chain
- comparison against `superpowers`, `compound-engineering`, and `gstack`

The goal is to clarify what should be strengthened next, what is optional, and what should remain out of scope.

## 1. Current Judgment

`cmon` is no longer mainly missing lifecycle stages.

The stronger remaining opportunities are now cross-cutting:

- make stage-entry context stronger
- make stage transitions more explicit
- make critique orchestration thinner and more reusable
- make the knowledge store more maintainable over time

This is a different problem from the earlier v1 gap list.

The v1 gap list focused on `design`, `plan`, `work`, and proof coverage.
Those core gaps are now mostly closed.

## 2. Comparison Summary

### What `cmon` already does well

- It separates `think`, `design`, `plan`, and `work` more clearly than the major reference repos.
- It keeps the execution boundary stronger than `compound-engineering` and lighter than `gstack`.
- It preserves the intended ownership model:
  - multi-lens for framing and review
  - owner-led design
  - engineering-owned planning
  - engineering-only execution

### What the reference repos still do better

- `superpowers`
  - stronger explicit stage gates
  - stronger "do not proceed yet" behavior

- `compound-engineering`
  - stronger research-first entry into planning
  - stronger reusable context and learning retrieval habits

- `gstack`
  - stronger plan-tightening orchestration
  - stronger "one command runs the critique gauntlet" ergonomics
  - stronger long-lived knowledge management ergonomics

## 3. Recommended Next Opportunities

### P0. Strengthen `cmon:understand` into a true stage-entry contract

Why this matters:

- The current `cmon:understand` is useful, but still too easy to treat as a light preface.
- The reference systems are stronger at forcing later stages to use recovered context rather than rediscovering it ad hoc.
- The original `cmon` design explicitly treated repo understanding as one of the places where multi-role separation is necessary.

What should change:

- standardize a stronger context packet
- require explicit recovery of:
  - relevant repo area
  - prior durable artifacts
  - local patterns
  - prior learnings worth reusing
  - constraints
  - unresolved unknowns
- make later stages consume the packet instead of silently re-scanning from scratch

Decision:

- do this now

### P0. Add a unified stage transition contract

Why this matters:

- `cmon` has many stage-local quality gates, but they are still expressed in different local ways.
- `superpowers` gains a lot of reliability from explicit stopping behavior.
- `gstack` gains a lot of consistency from its critique routing and readiness decisions.

What should change:

- define a standard transition decision shape for major handoffs
- use one of:
  - `proceed`
  - `revise`
  - `block`
- require a short reason and missing conditions for any non-`proceed` handoff

Decision:

- do this immediately after strengthening `cmon:understand`

### P1. Add a thin critique orchestrator without building a runtime

Why this matters:

- `cmon` now has design challenge, plan critique, work internal review, and review synthesis
- but it still lacks a very thin reusable orchestration wrapper

What should change:

- add a small contract such as `cmon:autocritique` or `cmon:pressure-test`
- input: an artifact and stage type
- output: a merged readiness decision

Decision:

- desirable, but only after the stronger context and transition contracts exist

### P1. Upgrade `cmon:compound` from capture to maintenance

Why this matters:

- `cmon:compound` can already create and update learnings
- but it does not yet behave like a maintainable knowledge system

What should change:

- stale doc review
- duplicate and overlap pruning
- topic-level refresh guidance
- stronger update-vs-new rules

Decision:

- desirable after the stage-entry and transition work

## 4. Lower-Priority Opportunities

- add a blocked-path example if later usage shows the current proof set is too optimistic
- add a code-changing `parallel` example only if the current docs-first proof becomes unconvincing
- add delegated substep packet conventions inside `cmon:work`

These can help later, but they are not the current bottleneck.

## 5. Explicit Non-Opportunities Right Now

These are intentionally not the next step, even though the reference repos do them well:

- `gstack`-style runtime, telemetry, browser QA, deploy, or update stack
- `superpowers`-style script-like plan choreography with inline implementation code
- symmetric multi-role co-authoring in `cmon:design`
- relaxing the execution boundary to accept broad model improvisation

These all move `cmon` away from the original design choice rather than closer to it.

## 6. Immediate Decision

The next implementation order should be:

1. strengthen `cmon:understand`
2. add the unified stage transition contract
3. consider thin critique orchestration
4. consider knowledge-base maintenance upgrades

## 6.1 Status Update

As of the current draft state:

- `cmon:understand` has been strengthened into a more explicit stage-entry contract
- the shared stage transition contract now exists and has been adopted into the major stage handoffs
- a first thin critique orchestration layer now exists through `cmon:pressure-test`
- a first knowledge-maintenance layer now exists through `cmon:refresh-knowledge`
- the primary design gap is no longer missing stages, but insufficient real-world dogfooding outside the `cmon` repo itself

So the next highest-value follow-ups are now:

1. dogfood the full workflow on real non-`cmon` work before adding more structure
2. consider light helper automation for the critique surface only if repeated manual use shows payoff
3. consider light helper automation for scoped knowledge refresh only if repeated maintenance work shows payoff

## 7. Related

- `docs/architecture/2026-04-07-core-skills-v0.md`
- `docs/architecture/2026-04-07-foundation-alignment-superpowers-ce-gstack.md`
- `docs/architecture/2026-04-07-workflow-proof-coverage-v0.md`
- `docs/architecture/2026-04-07-handoff-and-artifact-gc-analysis-v0.md`
- `docs/architecture/2026-04-08-shared-extra-capabilities-across-skill-repos-v0.md`
