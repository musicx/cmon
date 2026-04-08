# cmon Debug Skill v0

Date: 2026-04-08
Status: Draft

This document defines the initial design for `cmon:debug`.

## Purpose

`cmon:debug` exists to handle a recurring capability cluster that appears across major reference repos outside the base build lifecycle:

- root-cause-first debugging
- evidence-driven investigation
- refusal to patch symptoms before narrowing the actual failure boundary

`cmon:debug` is intentionally an auxiliary workflow skill.

It is not a new mandatory lifecycle stage.

It should be invoked when the workflow hits unexpected behavior:

- failing tests
- broken verification
- production or local bugs
- flaky integration behavior
- blocked execution caused by unclear failure origin

## Design Goal

The skill should be:

- general across languages and frameworks
- rooted in debugging habit, not stack-specific tooling
- usable before any fix attempt
- light enough to run without a runtime layer
- strict enough to stop random-walk patching

It should feel closer to:

- `superpowers:systematic-debugging` in discipline
- `Waza:/hunt` in compactness and anti-rationalization rules
- `compound-engineering:reproduce-bug` in hypothesis-driven structure

It should explicitly not depend on:

- `gsd-2` runtime supervision
- browser stacks
- issue trackers
- daemonized observability

Those can enrich later workflows, but they are not required for the base habit.

## What `cmon:debug` Should Do

`cmon:debug` should:

1. force the current symptom to be named clearly
2. force the current reproduction state to be checked
3. force evidence gathering before code edits
4. force a concrete root-cause hypothesis
5. force minimal hypothesis testing
6. route only after the failure boundary is understood

The expected output is not "the fix".

The expected output is:

- root cause
- evidence
- confidence
- next justified action

## What `cmon:debug` Should Not Do

It should not:

- become a generic bug-fix execution skill
- mix implementation and investigation in the same step
- become a read-only review skill
- depend on GitHub issue context
- assume browser reproduction
- silently route into broad refactors because the first fix seems hard

## Core Operating Model

The default investigation sequence should be:

1. state the symptom precisely
2. confirm or improve reproduction
3. inspect immediate evidence
4. inspect recent relevant changes and affected boundaries
5. trace backward from the observed failure
6. form one concrete hypothesis
7. add one targeted instrument
8. confirm or discard the hypothesis
9. only then decide whether the problem belongs in:
   - a narrow fix
   - a design correction
   - a plan correction
   - or a blocked escalation

This keeps the skill habit-oriented rather than tooling-oriented.

## Hard Rules

The first version of `cmon:debug` should enforce these rules:

1. no fix before a root-cause hypothesis
2. no environment claims from memory when version or setup may matter
3. same symptom after a fix invalidates the prior hypothesis
4. one hypothesis at a time
5. if evidence contradicts the hypothesis, discard it fully
6. after repeated failed hypotheses, stop and surface uncertainty rather than keep thrashing

The point is to make random-walk debugging harder.

## Relationship to Existing `cmon` Skills

### `cmon:work`

`cmon:work` executes approved units.

If execution reveals unexpected behavior and the cause is unclear, `cmon:work` should not improvise.
It should hand off to `cmon:debug`.

### `cmon:plan`

If debugging shows the problem is really a missing or wrong implementation boundary, handoff may return to `cmon:plan`.

### `cmon:design`

If debugging reveals the real problem is a behavior or state-model ambiguity rather than implementation error, the right route may be back to `cmon:design`.

### `cmon:review`

`cmon:review` is broader and multi-lens.

`cmon:debug` is narrower and investigation-first.

Use `cmon:debug` before fix attempts.
Use `cmon:review` after substantial implementation work.

## Typical Outputs

The skill should produce a compact debugging report with:

- symptom
- reproduction status
- evidence gathered
- root-cause hypothesis
- confirmed root cause or current best boundary
- next action recommendation

This is enough to support either:

- a narrow fix inside `cmon:work`
- or a route back to `cmon:plan` / `cmon:design`

## Initial Decision

`cmon` should add `cmon:debug` now as a supporting workflow skill.

Reason:

- it matches one of the strongest shared extra capability clusters across the reference repos
- it improves `cmon`'s reliability without widening the mandatory lifecycle
- it reinforces `cmon`'s contract-first and evidence-first bias

## Related

- `docs/architecture/2026-04-08-shared-extra-capabilities-across-skill-repos-v0.md`
- `docs/architecture/2026-04-07-core-skills-v0.md`
- `docs/architecture/2026-04-07-next-opportunities-and-decisions-v0.md`
