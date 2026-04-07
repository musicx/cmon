---
name: cmon:brainstorm
description: Deprecated compatibility alias. Use when an older workflow references cmon:brainstorm and redirect immediately to cmon:think.
---

# cmon:brainstorm (Deprecated Alias)

`cmon:brainstorm` is no longer the canonical skill name.

Use:

- `cmon:think`

Why:

- `cmon:think` now covers both:
  - idea generation and direction finding
  - requirements clarification for a chosen direction

Compatibility rule:

- if an operator, document, or old artifact says `cmon:brainstorm`, interpret it as `cmon:think`
- if the user clearly wants ideation, use `cmon:think` in `ideate` mode
- if the user clearly wants requirements clarification, use `cmon:think` in `brainstorm` mode
- if the request is already clear enough, use `cmon:think` in `fast-path`

This alias exists only to reduce migration breakage while older docs are being updated.
