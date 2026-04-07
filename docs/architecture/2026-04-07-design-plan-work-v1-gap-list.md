# cmon v1 Gap List: design, plan, work

Date: 2026-04-07
Status: Updated after `cmon:work` P0-3 implementation

This document turns the benchmark in `2026-04-07-design-plan-work-benchmark-v0.md` into an implementation-focused gap list.

The goal is not to list every possible improvement.
The goal is to define the next practical upgrades that move `cmon` toward the intended v1 quality bar.

## 1. Prioritization Logic

Priorities are assigned using this order:

1. does the gap materially affect execution quality
2. does the gap currently allow stage boundary drift
3. does fixing it unlock other workflow improvements
4. can it be implemented without introducing runtime-heavy infrastructure

## 2. P0 Gaps

### Implemented: P0-1 owner-led challenge workflow for `cmon:design`

What changed:

- `cmon:design` now has execution docs, operating procedure, owner prompts, challenger prompts, and challenge templates
- owner-led is no longer only philosophical, it now has a first operational workflow

Implemented artifacts:

- `agents/design/product-designer.md`
- `agents/design/engineering-designer.md`
- `agents/design/product-challenger.md`
- `agents/design/engineering-challenger.md`
- `agents/design/ops-challenger.md`
- `agents/design/design-synthesizer.md`
- `templates/design/design-run-manifest-template.md`
- `templates/design/challenge-invocation-template.md`
- `templates/design/design-synthesizer-input-template.md`
- `docs/architecture/2026-04-07-design-execution-v0.md`
- `docs/architecture/2026-04-07-design-operating-procedure-v0.md`
- updates to `skills/design/SKILL.md`
- updates to `templates/design/design-spec-template.md`

Remaining follow-up:

- a full end-to-end example should still exercise this stage explicitly
- future refinement may tighten the approval gate or add helper tooling, but the base gap is no longer open

### Implemented: P0-2 plan research and deepening flow for `cmon:plan`

What changed:

- `cmon:plan` now has execution docs, operating procedure, and templates for planning mode selection, research capture, and deepening
- planning no longer depends only on the static implementation plan template

Implemented artifacts:

- `docs/architecture/2026-04-07-plan-execution-v0.md`
- `docs/architecture/2026-04-07-plan-operating-procedure-v0.md`
- `templates/plans/plan-run-manifest-template.md`
- `templates/plans/plan-deepening-template.md`
- `templates/plans/research-summary-template.md`
- updates to `skills/plan/SKILL.md`
- updates to `templates/plans/implementation-plan-template.md`

Remaining follow-up:

- `agents/plan/feasibility-reviewer.md`
- `agents/plan/design-consistency-reviewer.md`
- `agents/plan/scope-risk-reviewer.md`
- critique is now available as a smaller pre-work stack, but later refinement may still tighten merge rules or example coverage

### Implemented: P0-3 add review loops inside `cmon:work`

What changed:

- `cmon:work` now defines a two-step internal review loop after verification and before external review
- the execution layer now requires spec compliance review followed by code-quality review
- work handoff artifacts now record those review-loop outcomes explicitly

Implemented artifacts:

- `agents/work/spec-compliance-reviewer.md`
- `agents/work/code-quality-reviewer.md`
- `templates/work/spec-compliance-input-template.md`
- `templates/work/code-quality-review-input-template.md`
- `docs/architecture/2026-04-07-work-review-loop-v0.md`
- updates to `skills/work/SKILL.md`
- updates to `docs/architecture/2026-04-07-work-execution-v0.md`
- updates to `docs/architecture/2026-04-07-work-operating-procedure-v0.md`
- updates to `templates/work/unit-execution-report-template.md`

Remaining follow-up:

- a future example should exercise the loop with a non-trivial unit, not only the protocol docs

## 3. P1 Gaps

### Implemented: P1-1 add execution strategy selection to `cmon:work`

What changed:

- `cmon:work` now requires an explicit execution-mode choice for non-trivial units
- the workflow now distinguishes `inline`, `serial`, and `parallel`
- `parallel` is explicitly forbidden unless write scopes are disjoint and sequencing is absent

Implemented artifacts:

- `templates/work/execution-strategy-template.md`
- updates to `work-run-manifest-template.md`
- updates to `skills/work/SKILL.md`
- updates to `docs/architecture/2026-04-07-work-execution-v0.md`
- updates to `work-operating-procedure-v0.md`

Remaining follow-up:

- the richer end-to-end example should exercise `serial` or `parallel` explicitly
- later refinement may add lightweight handoff conventions for delegated sub-steps, but not a runtime-heavy coordinator

### Implemented: P1-2 add system-wide interaction checks to `cmon:work`

What changed:

- `cmon:work` now distinguishes direct verification from system interaction checks
- verification now explicitly asks whether callbacks, middleware, retries, cleanup, or interface parity make non-local checking mandatory
- work handoff artifacts now carry the system interaction result when relevant

Implemented artifacts:

- `templates/work/system-interaction-check-template.md`
- updates to `templates/work/verification-evidence-template.md`
- updates to `templates/work/unit-execution-report-template.md`
- updates to `skills/work/SKILL.md`
- updates to `docs/architecture/2026-04-07-work-execution-v0.md`
- updates to `docs/architecture/2026-04-07-work-operating-procedure-v0.md`

Remaining follow-up:

- the richer end-to-end example should force this check to matter on a real scenario
- later refinement may add stronger heuristics for exactly when integration coverage is mandatory

### Implemented: P1-3 add plan critique stack on top of `cmon:plan`

What changed:

- `cmon:plan` now has a smaller pre-work critique stack layered on top of research and deepening
- plans can now be pressure-tested for design consistency, engineering feasibility, and scope/risk before `cmon:work`

Implemented artifacts:

- `agents/plan/design-consistency-reviewer.md`
- `agents/plan/engineering-feasibility-reviewer.md`
- `agents/plan/scope-risk-reviewer.md`
- `templates/plans/plan-critique-input-template.md`
- `templates/plans/plan-critique-summary-template.md`
- `docs/architecture/2026-04-07-plan-review-stack-v0.md`
- updates to `skills/plan/SKILL.md`
- updates to `docs/architecture/2026-04-07-plan-execution-v0.md`
- updates to `docs/architecture/2026-04-07-plan-operating-procedure-v0.md`
- updates to `templates/plans/plan-run-manifest-template.md`
- updates to `templates/plans/implementation-plan-template.md`

Remaining follow-up:

- a richer example should prove the critique stack catches and corrects a real weak plan
- later refinement may add merge rules or a dedicated synthesizer if usage shows the need

### P1-4: Refresh the end-to-end example to include explicit `cmon:design`

Problem:

- the current end-to-end example proves most of the chain, but it still does not fully exercise the new explicit design stage in a meaningful scenario

Target behavior:

- one end-to-end example that genuinely requires:
  - `cmon:think`
  - `cmon:design`
  - `cmon:plan`
  - `cmon:work`
  - `cmon:review`
  - `cmon:compound`

Why this matters:

- it is the fastest way to catch mismatched assumptions across artifacts

## 4. P2 Gaps

### P2-1: Consider downstream QA or ship-readiness layers

Problem:

- `cmon` currently ends at bounded work, review, and compound
- it does not yet define optional downstream delivery-quality workflows

Target behavior:

- if added later, these should sit after `work` and `review`
- they should not redefine the core meaning of `cmon:work`

Reference shape:

- take inspiration from `gstack`'s `qa` and `ship` layers only if and when the project wants delivery-oriented workflows

### P2-2: Add richer design-specific variants only if justified

Problem:

- it is possible that future design work will benefit from specialized variants such as visual design-system flows

Current recommendation:

- do not build this yet
- `cmon` should first prove that the generic owner-led design stage works

### P2-3: Add automation helpers only after manual procedures are stable

Problem:

- there is always a temptation to script orchestration too early

Current recommendation:

- manual-first remains correct
- helper scripts should come only after:
  - the stage contract is stable
  - the documents are being used consistently
  - the human operator path is already clear

## 5. Recommended Build Order

If only one lane is worked at a time, use this order:

1. `P0-1` owner-led `cmon:design` challenge flow
2. `P0-2` `cmon:plan` research and deepening flow
3. `P0-3` `cmon:work` internal review loops
4. `P1-3` `cmon:plan` critique stack
5. `P1-1` `cmon:work` execution strategy selection
6. `P1-2` `cmon:work` system-wide interaction checks
7. `P1-4` refreshed end-to-end example

The next unfinished items are now:

1. `P1-4` refreshed and richer end-to-end examples

## 6. Suggested Ownership Model

Because these gaps touch different parts of the workflow, use this ownership split:

- `design` lane
  - challenge flow
  - owner-led templates
  - challenger prompts

- `plan` lane
  - research flow
  - deepening flow
  - critique stack

- `work` lane
  - review loops
  - execution strategy
  - system interaction checks

This keeps the write scopes relatively clean.

## 7. Definition Of Success

This gap list is complete when:

- `cmon:design` is no longer only conceptually strong, but operationally strong
- `cmon:plan` behaves more like a mature planning workflow, not just a strong template
- `cmon:work` enforces alignment through review loops and strategy choices, not only through stated principles

At that point, `cmon` should be:

- structurally cleaner than the reference repos
- closer to `compound-engineering` on planning quality
- closer to `superpowers` on execution discipline
- selectively improved by `gstack`'s critique mentality without inheriting its runtime stack
