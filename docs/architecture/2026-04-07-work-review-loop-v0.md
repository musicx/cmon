# cmon Work Review Loop v0

Date: 2026-04-07
Status: Draft

This document defines the internal review loop inside `cmon:work`.

It exists to keep implementation aligned before the change graduates to explicit `cmon:verify` and, when warranted, broader `cmon:review`.

## 1. Why This Layer Exists

`cmon:verify` is the default post-work acceptance stage, and `cmon:review` is the broader optional multi-lens stage.

It should not be the first place where the workflow notices that:

- the implementation drifted from the approved unit
- the evidence does not prove the claimed result
- the code is obviously weak inside the approved scope

That narrower enforcement belongs inside `cmon:work`.

## 2. Loop Shape

The review loop is:

1. implementation
2. verification
3. spec compliance review
4. code-quality review
5. execution report
6. external `cmon:verify`

The order is mandatory.

## 3. Spec Compliance Review

Purpose:

- compare the implementation against approved requirements, design, and plan
- catch scope drift before explicit verification
- ensure evidence matches the unit claim

Primary artifact:

- `templates/work/spec-compliance-input-template.md`

Primary reviewer:

- `agents/work/spec-compliance-reviewer.md`

Pass condition:

- the unit is still the unit that was approved
- no material design or requirements drift remains
- verification actually proves the claimed outcome

## 4. Code-Quality Review

Purpose:

- inspect the completed unit for obvious engineering weakness
- improve the quality bar without reopening broader design debates

Primary artifact:

- `templates/work/code-quality-review-input-template.md`

Primary reviewer:

- `agents/work/code-quality-reviewer.md`

Pass condition:

- no material maintainability trap remains
- verification and tests are strong enough for the unit
- no obvious in-scope edge case is left behind

## 5. Outcome Rules

If spec compliance review returns `fix_required`:

- return to the same unit
- do not continue to code-quality review
- rerun verification after the fix if behavior changed

If code-quality review returns `fix_required`:

- return to the same unit
- rerun verification when relevant
- rerun the review loop before handoff

If both reviews pass:

- write the unit execution report
- hand the unit to `cmon:verify`

## 6. Boundaries

This loop does not replace `cmon:verify` or `cmon:review`.

It is intentionally narrower.

It does not:

- make final product judgment
- synthesize product, engineering, and operations concerns
- authorize scope expansion
- auto-fix issues

## 7. Reference Influence

This layer is mainly influenced by:

- `superpowers`
  - execution discipline
  - verification before completion
  - review checkpoints during implementation

- `compound-engineering`
  - preserving a strong engineering judgment loop without requiring a large runtime

`cmon` intentionally keeps the loop smaller than both:

- no runtime-heavy dispatcher
- no giant persona matrix
- no automatic patch-application pipeline in v0

## 8. Next Useful Follow-Up

The next upgrades after this loop are:

1. a blocked example that exercises delegated execution and the review loop together
2. a more code-bearing example only if later review shows the current proof set is too docs-skewed
