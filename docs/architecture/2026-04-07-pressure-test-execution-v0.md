# cmon Pressure-Test Execution v0

Date: 2026-04-07
Status: Draft

This document turns `cmon:pressure-test` from a helper idea into a reusable execution surface.

## 1. Purpose

`cmon:pressure-test` exists to reuse existing critique stacks without:

- inventing a new runtime
- widening scope into fresh authoring
- forcing each stage to improvise its own readiness ritual

Its job is to take an existing artifact, run the smallest relevant critique surface, and return one merged `proceed / revise / block` decision.

## 2. Execution Stages

### Stage 1: Resolve The Target Stage

Start from:

- `templates/workflow/pressure-test-run-manifest-template.md`

Supported targets:

- `design`
- `plan`
- `work`
- `review`

If the target is not one of those four:

- stop
- return `block`

`cmon:pressure-test` is not a generic orchestrator for every repo artifact.

### Stage 2: Verify Minimum Artifact Set

Before critique starts, verify:

- the primary artifact exists
- the expected next stage is coherent for the target stage
- the minimum supporting artifacts are present

Minimum expectations by target:

- `design`
  - design artifact
  - approved requirements

- `plan`
  - plan artifact
  - requirements
  - design when relevant

- `work`
  - work execution report or work handoff packet
  - requirements/design/plan references
  - verification evidence

- `review`
  - review packet or review context bundle
  - diff summary
  - intent artifacts when they exist

If the missing artifacts make critique untrustworthy:

- return `block`

### Stage 3: Route To Existing Critique Surface

Use the current stage-owned surface rather than inventing a new one.

Routing table:

| Target | Reused surface | Output focus |
|---|---|---|
| `design` | owner-led challenge plus design synthesizer | planning readiness |
| `plan` | plan critique stack plus critique summary | execution readiness |
| `work` | spec compliance plus code-quality review | verification or broader-audit readiness |
| `review` | review packet completeness plus review synthesis | acceptance or downstream routing readiness |

### Stage 4: Normalize Findings

The reused critique surface may return stage-local language such as:

- `ready`
- `accepted`
- `accepted_with_followup`
- `requires_fixes`
- `revise_plan`

`cmon:pressure-test` must normalize these into:

- `proceed`
- `revise`
- `block`

The normalized result should preserve:

- strongest reason not to proceed
- strongest missing condition
- the real next target

### Stage 5: Write The Pressure-Test Summary

Use:

- `templates/workflow/pressure-test-summary-template.md`

The summary should record:

- target stage
- critique surface used
- key findings
- the merged judgment

### Stage 6: Emit Transition Decision

Use:

- `templates/workflow/stage-transition-decision-template.md`

This is the real output contract.

## 3. Readiness Rules By Target

### Design

`proceed` only when:

- design quality is strong enough for planning
- non-owner challenge no longer exposes implementation-shaping ambiguity

### Plan

`proceed` only when:

- boundaries are credible
- file scope is explicit
- test scenarios are concrete
- critique findings are either resolved or truly minor

### Work

`proceed` only when:

- evidence exists
- internal review loop passed
- handoff package is coherent enough for explicit verification or justified broader audit

### Review

`proceed` only when:

- the packet is complete enough to judge
- the synthesis result actually supports the proposed downstream target

## 4. Policy Choice

`cmon:pressure-test` should be:

- thin
- stage-aware
- conservative in missing-artifact situations

It should not become:

- a parallel review factory
- a replacement for the real stage skills
- a mandatory step for every tiny artifact

## 5. Related

- `skills/pressure-test/SKILL.md`
- `docs/architecture/2026-04-07-stage-transition-contract-v0.md`
- `docs/architecture/2026-04-07-pressure-test-operating-procedure-v0.md`
