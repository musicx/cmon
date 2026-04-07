# cmon Plan Operating Procedure v0

Date: 2026-04-07
Status: Draft

This procedure describes how to run `cmon:plan` with explicit research and deepening behavior.

It is intentionally manual-first.

## 1. Inputs

Before starting, collect:

- approved requirements artifact
- approved design artifact when relevant
- existing plan when deepening
- any prior learnings or architecture notes already known to be relevant

Then create:

- `templates/plans/plan-run-manifest-template.md`

## 2. Step 1: Lock Planning Mode

Record:

- whether this pass is `create` or `deepen`
- what ambiguity or weakness the plan must eliminate
- which questions must be answered during planning
- what may be deferred safely to execution
- where the resulting plan should be written

If the difference between `create` and `deepen` is unclear:

- choose `deepen` only when a real plan already exists and the task is to strengthen it
- otherwise choose `create`

## 3. Step 2: Resolve Upstream Truth

Read:

- the requirements artifact
- the design artifact when one exists
- the existing plan when deepening

If the work still depends on unresolved product or design decisions:

- stop and route back to `cmon:think` or `cmon:design`

Do not let planning quietly absorb upstream ambiguity.

## 4. Step 3: Run Local Research

Recover the local context that should shape the plan:

- patterns to follow
- constraints to respect
- prior learnings to reuse
- likely files and tests the work will touch

Capture this using:

- `templates/plans/research-summary-template.md`

Local research is expected even for lightweight plans, though the amount of detail should scale with the work.

## 5. Step 4: Decide Whether External Research Is Needed

Run external research only when it changes planning quality materially.

Typical triggers:

- high-risk domains such as security, payments, migrations, or external APIs
- no strong local pattern exists
- the repo has only thin or adjacent examples rather than direct ones

If local patterns are strong, skip external research and continue.

## 6. Step 5: Write Or Deepen The Plan

For `create` mode:

- use `templates/plans/implementation-plan-template.md`

For `deepen` mode:

- use `templates/plans/plan-deepening-template.md`
- strengthen the existing plan in place

Deepening should target:

- missing traceability
- vague file scope
- weak test scenarios
- oversized or underspecified implementation units
- poor sequencing or hidden dependencies

## 7. Step 6: Run The Plan Self-Check

Before handoff, verify:

- the plan traces back to requirements and design
- feature-bearing units have concrete test scenarios
- file scope is explicit
- deferred questions really belong to execution, not planning
- the plan is still a decision artifact, not a coding script

If these checks fail, keep revising inside `cmon:plan`.

## 8. Step 7: Run The Critique Stack When Needed

If the plan is non-trivial, cross-cutting, or risk-bearing, assemble:

- `templates/plans/plan-critique-input-template.md`

Then run the three default critiques:

- design consistency
- engineering feasibility
- scope and risk

Merge the outcome using:

- `templates/plans/plan-critique-summary-template.md`

If material critique findings remain, revise the plan before handoff.

## 9. Step 8: Route To The Next Skill

If the plan is strong and non-blocking:

- move to `cmon:work`

If the plan is still weak:

- remain in `cmon:plan`

If upstream ambiguity was rediscovered:

- route back to `cmon:think` or `cmon:design`

## 10. Failure Cases

Stop and surface the issue when:

- source artifacts contradict each other
- local research reveals the chosen direction no longer fits the repo
- a deferred question is actually a hidden planning blocker
- the plan keeps drifting into file choreography or pseudo-implementation
- critique findings show that the plan is not actually ready for execution

`cmon:plan` should fail by exposing weak decisions, not by pretending the executor will figure them out.
