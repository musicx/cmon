# cmon Plan Execution v0

Date: 2026-04-07
Status: Draft

This document turns `cmon:plan` from a strong plan template into a planning workflow with explicit research, deepening, and critique behavior.

## 1. Purpose

`cmon:plan` exists to convert approved intent into a bounded implementation plan that an executor can trust.

This execution layer adds the missing workflow behavior:

- source and scope resolution
- local research before structuring
- conditional external research for risky or novel areas
- explicit deepening when an existing plan is not yet strong enough
- a smaller pre-work critique stack before execution begins

## 2. Execution Stages

### Stage 1: Resolve Planning Mode

Start from:

- approved requirements artifact
- approved design artifact when relevant
- task request
- explicit operator control when needed through `templates/plans/plan-run-manifest-template.md`

Choose one mode:

- `create` when no existing plan should be updated
- `deepen` when an existing plan needs higher confidence, more concrete boundaries, or stronger test guidance

### Stage 2: Resolve Upstream Source Truth

Locate:

- requirements artifact
- design artifact when relevant
- prior plan if deepening

If product behavior or design ambiguity still blocks planning:

- stop and return upstream instead of letting planning invent it

### Stage 3: Run Local Research

Local research is the default, not the exception.

Recover:

- relevant repo patterns
- relevant constraints
- relevant prior learnings
- likely implementation surfaces

Capture the result using:

- `templates/plans/research-summary-template.md`

### Stage 4: Decide On External Research

External research is conditional.

Lean toward it when:

- the topic is high-risk
- the codebase lacks direct local patterns
- the work touches thin or novel technical areas

Skip it when local patterns are already strong and current.

### Stage 5: Structure Or Deepen The Plan

For `create` mode:

- draft the plan using `templates/plans/implementation-plan-template.md`

For `deepen` mode:

- analyze the existing plan's weak points
- run a deepening pass using `templates/plans/plan-deepening-template.md`
- tighten traceability, file scope, sequencing, and test scenarios

### Stage 6: Run Plan Self-Check

Before handoff, confirm:

- requirements and design trace are explicit
- file scope is exact
- feature-bearing units have concrete test scenarios
- execution posture is carried when needed
- no major ambiguity is being hidden in deferred questions

### Stage 7: Run Pre-Work Critique Stack

For non-trivial plans, run a smaller critique stack before execution.

The default reviewers are:

- design consistency
- engineering feasibility
- scope and risk

Use:

- `templates/plans/plan-critique-input-template.md`
- `templates/plans/plan-critique-summary-template.md`

The purpose is not to replace planning ownership.

The purpose is to catch:

- design drift
- weak feasibility assumptions
- unjustified scope or hidden risk

### Stage 8: Route To Next Skill

If the plan is strong enough:

- move to `cmon:work`

If not:

- remain in `cmon:plan`

If upstream ambiguity was rediscovered:

- route back to `cmon:think` or `cmon:design`

## 3. v0 Policy Choice

`cmon:plan` is still engineering-owned.

This execution layer now adds a smaller critique stack, but keeps it lighter than `gstack/autoplan`.

The policy choice is:

- planning remains engineering-owned
- critique is narrow and pre-work only
- no runtime-heavy orchestration or multi-round approval loop in v0.1

## 4. What Was Borrowed From Mature Systems

From `compound-engineering`:

- requirements as source of truth
- research before structuring
- deepening instead of constant rewrites
- portable plans rather than executor-specific scripts

From `superpowers`:

- explicit unit boundaries
- insistence that execution should not improvise around vague plans

## 5. What cmon Intentionally Does Differently

- no whole-plan code choreography
- no mandatory external research for every plan
- no runtime-heavy review or orchestration layer in the base planning flow

## 6. Next Step

This execution doc now has a matching manual operating procedure:

- `docs/architecture/2026-04-07-plan-operating-procedure-v0.md`
- `docs/architecture/2026-04-07-plan-review-stack-v0.md`

The next useful upgrade after this document is:

- execution strategy selection inside `cmon:work`
