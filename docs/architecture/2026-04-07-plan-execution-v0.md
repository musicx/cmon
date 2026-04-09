# cmon Plan Execution v0

Date: 2026-04-07
Status: Draft

This document turns `cmon:plan` from a strong plan template into a planning workflow with explicit research, deepening, critique behavior, and a required execution JSON graph.

## 1. Purpose

`cmon:plan` exists to convert approved intent and approved design into a bounded implementation package that a human approver and executor can trust.

This execution layer adds the missing workflow behavior:

- source and scope resolution
- local research before structuring
- conditional external research for risky or novel areas
- explicit deepening when an existing plan is not yet strong enough
- a required execution JSON task graph
- a smaller planning critique stack before package challenge begins

## 2. Execution Stages

### Stage 1: Resolve Planning Mode

Start from:

- approved requirements artifact
- human-approved design artifact when relevant
- task request
- explicit operator control when needed through `templates/plans/plan-run-manifest-template.md`

Choose one mode:

- `create` when no existing plan should be updated
- `deepen` when an existing plan needs higher confidence, more concrete boundaries, or stronger test guidance

### Stage 2: Resolve Upstream Source Truth

Locate:

- requirements artifact
- human approval artifact for design when design was required
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

### Stage 5: Structure Or Deepen The Plan And Execution JSON

For `create` mode:

- draft the plan using `templates/plans/implementation-plan-template.md`
- draft the matching execution graph using `templates/plans/execution-graph-template.json`

For `deepen` mode:

- analyze the existing plan's weak points
- run a deepening pass using `templates/plans/plan-deepening-template.md`
- tighten traceability, file scope, sequencing, test scenarios, and execution JSON task state

### Stage 6: Run Plan Self-Check

Before handoff, confirm:

- requirements and design trace are explicit
- human design approval is referenced when required
- file scope is exact
- feature-bearing units have concrete test scenarios
- the execution JSON exists, is valid JSON, and matches the Markdown plan
- execution posture is carried when needed
- no major ambiguity is being hidden in deferred questions

### Stage 7: Run Planning Critique Stack

For non-trivial plans, run a smaller critique stack before package challenge.

The default reviewers are:

- design consistency
- engineering feasibility
- scope and risk

Use:

- `templates/plans/plan-critique-input-template.md`
- `templates/plans/plan-critique-summary-template.md`

The purpose is not to replace planning ownership or `cmon:challenge(mode=package)`.

The purpose is to catch:

- design drift
- weak feasibility assumptions
- unjustified scope or hidden risk
- Markdown/JSON mismatch

### Stage 8: Route To Next Skill

Use:

- `templates/workflow/stage-transition-decision-template.md`

If the plan is strong enough:

- `proceed -> cmon:challenge(mode=package)`

If not:

- `revise -> cmon:plan`

If upstream ambiguity was rediscovered:

- `block`
- route back to `cmon:think` or `cmon:design`

## 3. v0 Policy Choice

`cmon:plan` is still engineering-owned.

This execution layer now adds a smaller critique stack, but keeps it lighter than `gstack/autoplan`.

The policy choice is:

- planning remains engineering-owned
- critique is narrow and prepares the package for the formal multi-role challenge
- every `cmon:plan` writes both Markdown and execution JSON, including one-task plans
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
