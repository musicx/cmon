# cmon Challenge Skill v0

Date: 2026-04-08
Status: Draft

This document records the refactor from `cmon:pressure-test` to `cmon:challenge`.

## Why This Exists

Dogfooding exposed two issues:

- the old `pressure-test` name was weak and misleading
- its scope had drifted too wide, overlapping with post-work verification and broader review

The pre-work gate needs a clearer identity.

## Decision

Replace the old canonical pre-work gate with:

- `cmon:challenge`

`cmon:challenge` is now the canonical pre-implementation multi-role challenge stage.

It should be used after `cmon:design` and `cmon:plan`, before `cmon:work`.

## New Boundaries

`cmon:challenge` is for:

- challenging design artifacts
- challenging plan artifacts
- challenging a combined design-plus-plan package

It is not for:

- completed implementation review
- code review
- packet completeness checks after work

## Role Model

`cmon:challenge` should use the same three lenses that mattered in earlier multi-role review:

- product
- engineering
- operations

The difference is timing and object:

- `challenge` tests proposed work before implementation
- `verify` tests implemented work after implementation

## Relationship To Old Skills

### `cmon:pressure-test`

The old skill is no longer canonical.

Keep it only as a deprecated compatibility alias to `cmon:challenge`.

### `cmon:review`

The earlier broader review content is now split:

- pre-work multi-role challenge becomes `cmon:challenge`
- post-work engineering acceptance becomes `cmon:verify`

Keep `cmon:review` only as a deprecated compatibility alias for older workflows that still mean "challenge the proposed solution before coding."

## Corrected Lifecycle

```text
cmon:understand -> cmon:think -> cmon:design -> cmon:plan -> cmon:challenge -> cmon:work -> cmon:verify -> cmon:compound
```

Not every task needs the full chain, but this is the canonical path for substantial new work.

