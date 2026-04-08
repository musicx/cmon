---
name: cmon:pressure-test
description: Deprecated compatibility alias. Use when an older workflow references cmon:pressure-test and redirect immediately to cmon:challenge.
---

# cmon:pressure-test

Deprecated compatibility alias.

`cmon:pressure-test` is no longer the canonical pre-work gate.

Use `cmon:challenge` instead.

## Redirect

When an older workflow mentions `cmon:pressure-test`, immediately reinterpret it as:

- `cmon:challenge`

The modern contract is:

- pre-work multi-role challenge of `design` / `plan`
- not post-work verification
- not a generic readiness shim across the whole chain

## Related

- `skills/challenge/SKILL.md`
- `docs/architecture/2026-04-08-challenge-skill-v0.md`
