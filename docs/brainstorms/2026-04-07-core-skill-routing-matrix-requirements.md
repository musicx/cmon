---
title: core skill routing matrix
status: approved
date: 2026-04-07
---

# Core Skill Routing Matrix

## Problem Frame

`cmon` now has enough skills, templates, and execution docs that an operator can lose time deciding which core skill to enter next. The repo has the information, but it is spread across multiple docs.

## Intended Outcome

An operator can quickly determine:

- which `cmon:*` skill to use next
- what that skill requires
- what that skill must produce
- when the operator should bounce back to an earlier stage instead of drifting forward

## Requirements

### Core Behavior

- R1. Add one compact routing reference for the six core `cmon:*` skills.
- R2. The reference must show `Use When`, `Requires`, `Produces`, `Do Not Use It For`, and `Normal Next Step`.
- R3. The reference must preserve the canonical lifecycle order already established in the repo.

### Constraints Or Guardrails

- R4. The artifact must stay concise and operator-facing rather than restating every full skill doc.
- R5. The change must not invent new lifecycle stages, runtime layers, or alternate naming.
- R6. Cross-linking many existing docs is intentionally out of scope for this unit; the artifact itself is the deliverable.

## Success Criteria

- A reader can choose the correct next core skill without reading five separate docs.
- The matrix makes stage boundaries and bounce-back conditions obvious.

## Scope Boundaries

- No new skill names
- No changes to lifecycle order
- No full rewrite of the core skill docs
- No global discoverability pass across all existing docs in this unit

## Key Decisions

- Single matrix doc rather than expanding `AGENTS.md`: keeps the operational reference durable without inflating the project guide.
- Include entry checks in addition to the matrix: routing errors usually happen at stage boundaries, not in skill names themselves.

## Risks Or Tensions

- If the doc becomes too detailed, it duplicates the skill docs.
- If it is too short, it stops being actionable for operators.

## Open Questions

### Resolve Before Planning

- none

### Deferred To Planning

- Whether a later follow-up should link this doc from `AGENTS.md` or `core-skills-v0.md`

## Next Step

- `cmon:plan` when `Resolve Before Planning` is empty
- resume `cmon:think` when blocking questions remain
