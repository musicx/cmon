# cmon Auxiliary Skill Invocation Policy v0

Date: 2026-04-07
Status: Draft

This document defines when auxiliary `cmon:*` skills should be invoked.

The goal is to keep the system disciplined without turning every pass into mandatory ceremony.

Current auxiliary skills:

- `cmon:pressure-test`
- `cmon:refresh-knowledge`

## 1. `cmon:pressure-test`

### Recommended

Use `cmon:pressure-test` when:

- a `design` artifact exists and the next decision is whether planning may begin
- a `plan` exists and the work is non-trivial enough that critique should be reused explicitly
- a `work` handoff package exists and you want one explicit readiness pass before broader review
- a `review` packet exists but acceptance confidence depends on packet completeness

### Conditionally Mandatory

Treat `cmon:pressure-test` as effectively mandatory when:

- the artifact is non-trivial and cross-cutting
- the next stage is expensive to start wrong
- prior critique surfaces already exist but would otherwise be skipped ad hoc

### Usually Skip

Usually skip it when:

- the artifact is tiny and the underlying stage already includes the necessary critique inline
- the pressure-test would duplicate a critique pass already run moments ago with no new evidence

## 2. `cmon:compound` vs `cmon:refresh-knowledge`

### Use `cmon:compound`

When the main question is:

- what new reusable lesson did this accepted work create

Typical outputs:

- new bug learning
- new pattern doc
- update to one clearly related existing doc

### Escalate To `cmon:refresh-knowledge`

Escalate when the main question becomes:

- is the existing knowledge area itself drifting, overlapping, or contradictory

Typical triggers:

- multiple stale candidates are discovered
- overlap or duplication goes beyond one simple in-place update
- a pattern doc looks broader than current evidence supports
- a compound pass reveals that maintenance should target a topic area, not just one new learning

## 3. `cmon:refresh-knowledge`

### Recommended

Use it when:

- stale, overlapping, duplicated, or too-broad docs are already suspected
- a recent `compound` pass points to a narrow maintenance follow-up

### Conditionally Mandatory

Treat it as effectively mandatory when:

- accepted newer evidence clearly contradicts older guidance
- duplicate docs are likely to cause future drift if left alone

### Usually Skip

Usually skip it when:

- one simple `compound` update is enough
- the evidence for drift is still weak
- the scope would be broad enough that the pass is really a docs rewrite project

## 4. Policy Choice

Auxiliary skills should be:

- explicit
- narrow
- justified by current artifact maturity

They should not become:

- mandatory boilerplate on every small task
- a shadow lifecycle parallel to the real core chain
