# cmon Challenge And Verify Benchmark v0

Date: 2026-04-08
Status: Draft

This document compares:

- the old mixed `cmon:review` surface
- the current `cmon:challenge`
- the current `cmon:verify`
- relevant reference-repo capabilities in `superpowers`, `compound-engineering`, `gstack`, and `Waza`

The goal is to decide whether the recent split is only a naming change, or a real workflow improvement, and what should be upgraded next.

## 1. Core Judgment

The split from one broad `review` stage into:

- `cmon:challenge`
- `cmon:verify`

is directionally correct.

It improves stage clarity:

- `challenge` judges whether the proposed solution should survive before code exists
- `verify` judges whether the implemented unit should be accepted after code exists

This is not just a rename.

It is a real separation of:

- pre-work multi-role challenge
- post-work engineering acceptance

## 2. What Old `cmon:review` Actually Covered

The earlier `cmon:review` surface mixed two distinct jobs:

1. pre-work multi-role challenge
   - does the design / plan package still solve the right problem
   - is scope right-sized
   - do engineering and operations assumptions survive challenge

2. post-work change acceptance
   - does the diff still match approved requirements, design, and plan
   - does verification evidence actually support the claim
   - what engineering and runtime risks remain

This older surface was strong in one important way:

- it already had mature reviewer prompts
- it already had a structured finding schema
- it already had conservative synthesis rules

So the old problem was not lack of review depth.

The old problem was role and timing ambiguity.

## 3. What Improved With The Split

### `cmon:challenge`

Improved:

- timing is now correct
- scope is now explicitly pre-implementation only
- the required lenses are now explicit
- it no longer competes with post-work verification

### `cmon:verify`

Improved:

- it can now be the default post-work gate
- it is easier to explain as engineering acceptance
- it can focus on plan alignment, evidence sufficiency, and engineering quality

## 4. What Got Weaker After The Split

The split clarified stage boundaries, but it also exposed an execution gap.

The old `review` surface had:

- product / engineering / operations prompts
- severity and action routing
- merge and dedup rules
- explicit scope verdicts such as `on_target`, `drift`, `incomplete`

The new `challenge` initially had only:

- stage definition
- simple manifest
- simple summary

So `challenge` became conceptually clearer, but operationally thinner.

This is the main current gap.

## 5. Reference Repo Comparison

### `gstack`

Closest matching capability:

- `plan-eng-review`
- `plan-design-review`
- `autoplan`

What matters:

- plans are challenged before coding
- multiple review lenses matter before implementation starts
- critique pressure improves plan quality more than richer templates alone

What should be absorbed:

- stronger pre-work challenge prompts
- structured findings rather than a loose summary
- explicit challenge target distinction between design-heavy and engineering-heavy concerns

What should not be absorbed:

- heavy runtime and interactive approval choreography
- large auto-review gauntlets for every task

### `superpowers`

Closest matching capability:

- `requesting-code-review`
- `verification-before-completion`

What matters:

- review is frequent and early
- evidence is mandatory before completion claims
- review is a recurring control point, not only an end-of-project ceremony

What should be absorbed:

- harder verification gate behavior inside `cmon:verify`
- explicit hard stops when evidence or claim alignment is weak

What should not be absorbed:

- always dispatching a separate reviewer after every small unit regardless of current `cmon` stage structure

### `compound-engineering`

Closest matching capability:

- `ce:review`

What matters:

- structured reviewer outputs
- severity and routing metadata
- merge and dedup logic
- confidence-sensitive review synthesis

What should be absorbed:

- better structured findings for `cmon:challenge`
- optional depth or conditional specialist logic for `cmon:verify`

What should not be absorbed:

- large persona matrix or headless runtime complexity as a default requirement

### `Waza`

Closest matching capability:

- `check`

What matters:

- review depth classification
- hard-stop catalog
- proof before claiming done

What should be absorbed:

- light depth distinction inside `cmon:verify`
- explicit hard-stop catalog for unacceptable post-work situations

What should not be absorbed:

- a one-skill "does everything before ship" bundle, because `cmon` is intentionally stage-separated

## 6. Decision

The current split should remain.

Do not revert to one broad `review` stage.

Instead:

1. upgrade `cmon:challenge` until it inherits the strongest operational parts of the old `review` surface
2. tighten `cmon:verify` until it behaves like a serious post-work engineering gate

## 7. Immediate Upgrade Order

### P0: make `cmon:challenge` fully operational

Add:

- dedicated product / engineering / operations challenge prompts
- challenge context bundle template
- challenge lens invocation template
- challenge synthesizer input template
- structured finding schema
- conservative merge rules
- scope verdict

### P1: tighten `cmon:verify`

Add later:

- verification depth distinction
- hard-stop catalog
- conditional specialist escalation when risk is clearly high

## 8. Current Recommendation

The next implementation step should be:

- upgrade `cmon:challenge` first

Reason:

- the stage split is already correct
- `verify` is usable now
- `challenge` is the part that still lacks an execution surface as strong as the old review system
