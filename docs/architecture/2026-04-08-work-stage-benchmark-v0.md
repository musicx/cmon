# cmon Work Stage Benchmark v0

Date: 2026-04-08
Status: Draft

This document compares `cmon:work` against the implementation-stage methods in the main reference repos and records the next `cmon` upgrades worth adopting.

## 1. Baseline

Current `cmon:work` is deliberately narrow:

- approved plan or bounded unit required
- explicit boundary lock before editing
- fresh verification evidence
- system interaction checks when impact is non-local
- internal spec-compliance and code-quality review loop
- explicit handoff to `cmon:verify`

This keeps `cmon` more bounded than the broader execution workflows in the reference repos.

## 2. Reference Comparison

### `superpowers`

Most useful execution strengths:

- isolation before execution
- blocked means stop, not improvise
- implementer and reviewer are clearly separated
- spec review happens before code-quality review

What `cmon` already has:

- bounded unit execution
- two-step internal review loop
- explicit stop on scope drift

What `cmon` still lacks:

- stronger binding between execution and workspace isolation
- more explicit delegation contract when execution is not inline
- clearer blocked / escalation hard stops

### `compound-engineering`

Most useful execution strengths:

- practical branch / worktree decision early in execution
- explicit choice between inline, serial, and parallel execution
- continuous testing and meaningful checkpoints
- simplification pass after several related units

What `cmon` already has:

- inline / serial / parallel strategy choice
- system interaction checks
- explicit verification contract

What `cmon` still lacks:

- delegated unit packet for serial or parallel sub-execution
- stronger checkpoint discipline between units
- explicit simplification trigger after related units accumulate

### `gstack`

Most useful adjacent strengths:

- post-implementation QA loops
- fix and re-verify cycles
- ship-readiness framing

What `cmon` should borrow:

- respect for re-verification after changes

What `cmon` should not borrow:

- runtime-heavy orchestration
- delivery stack inside `work`

### `Waza`

Useful reminder:

- do not turn implementation itself into a giant meta-process
- keep post-work quality and debugging separate from feature execution

This supports `cmon`'s current split:

- `cmon:work`
- `cmon:debug`
- `cmon:verify`

## 3. Decisions

The next `cmon:work` upgrades should be:

1. stronger `cmon:worktree` trigger conditions inside `cmon:work`
2. delegated execution packet for `serial` and `parallel` strategies
3. lightweight unit checkpoint discipline, without forcing a git commit
4. simplification trigger after several related units
5. harder escalation catalog for when execution must stop and route upstream

## 4. Policy Choice

These upgrades should make `cmon:work` more operational without changing its philosophy.

Do:

- tighten execution discipline
- improve delegation quality
- improve traceability across units

Do not:

- allow bare-prompt execution to bypass planning
- add runtime orchestration
- move post-work verification back into `cmon:work`
- force incremental git commits as a universal rule

## 5. Outcome

`cmon:work` should remain the bounded implementation stage.

The goal is not to make it more autonomous.

The goal is to make it:

- harder to drift
- easier to delegate safely
- easier to inspect mid-flight
- easier to stop when the unit is no longer valid
