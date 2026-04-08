---
name: cmon:debug
description: Use when a bug, failing test, broken verification step, or unexpected behavior appears and the right next move is to determine root cause before proposing or applying a fix.
---

# cmon:debug

Investigate first.
Fix later.

`cmon:debug` exists to stop random-walk patching and force a clearer explanation of what is actually wrong before work continues.

This is an auxiliary workflow skill.

Use by default:

- `templates/debug/debug-run-manifest-template.md`
- `templates/debug/debug-report-template.md`

## When to Use

Use this skill when one or more of these are true:

- a test is failing and the cause is not yet clear
- `cmon:work` hit unexpected behavior during execution
- verification failed and the failure boundary is uncertain
- a bug is reproducible but not yet explained
- the same symptom has survived one attempted fix
- the operator wants an evidence-backed root-cause investigation before implementation resumes

## Non-Goals

Do not use this skill to:

- perform broad code review
- write a full implementation plan
- jump straight into a fix because it seems obvious
- treat issue text, logs, or guesses as proof by themselves
- perform a large refactor under the label of debugging

## Core Questions

This skill should answer:

1. what is the exact symptom
2. can it be reproduced reliably, and if not, what is still missing
3. what evidence exists right now
4. what boundary in the system is most likely wrong
5. what single hypothesis best explains the symptom
6. what targeted instrument can confirm or discard that hypothesis
7. once the cause is understood, what is the smallest justified next action

## Workflow

1. State the current symptom precisely
2. Confirm the current reproduction path or document what makes it partial
3. Read the immediate evidence carefully
4. Inspect the relevant code path and recent changes
5. Trace backward from the visible failure boundary
6. Form one concrete root-cause hypothesis
7. Add one targeted instrument, assertion, log, or minimal failing test
8. Run it and confirm or discard the hypothesis
9. Repeat only with new evidence, not with accumulated guesses
10. Once the failure boundary is understood, route to the right next skill

## Root-Cause Standard

Do not claim root cause until it can be stated in a specific sentence:

`I believe the root cause is [X] in [file, function, condition, or boundary] because [evidence].`

Weak statements are not root causes.

Examples of weak statements:

- "state issue"
- "probably a race condition"
- "something wrong with config"

Examples of strong statements:

- stale value introduced in a specific hook because a dependency is missing
- retry path swallowing the original error at one boundary
- middleware assuming a field exists when one caller never sets it

## Evidence Rules

Preferred evidence:

- exact failing command output
- precise reproduction steps
- stack traces or log excerpts
- direct inspection of the relevant code path
- one targeted assertion, instrumentation point, or failing test

Unacceptable evidence:

- memory of what the environment "probably" is
- confidence without a confirming check
- multiple speculative fixes bundled together

## Hard Rules

- No fix before a root-cause hypothesis
- No environment or version claims from memory when they matter
- Same symptom after a fix invalidates the previous hypothesis
- One hypothesis at a time
- If evidence contradicts the hypothesis, discard it fully
- After repeated failed hypotheses, stop and surface uncertainty instead of thrashing
- Do not expand into unrelated cleanup during debugging

## Output

Report:

- `Symptom`
- `Reproduction status`
- `Evidence gathered`
- `Current hypothesis`
- `Confirmed root cause` or `Best current boundary`
- `Recommended next action`

The output should be compact and operational.

Its job is to support the next correct handoff, not to narrate everything learned.

## Typical Handoffs

Use:

- `templates/workflow/stage-transition-decision-template.md`

Typical transitions:

- `proceed -> cmon:work`
  - when the cause is clear, the next step is a narrow fix, and `cmon:work` preconditions still hold

- `revise -> cmon:debug`
  - when the current hypothesis was invalidated and another evidence-backed pass is needed

- `block -> cmon:plan`
  - when the problem is really a missing or broken implementation boundary

- `block -> cmon:design`
  - when the problem is actually a behavior, state, or boundary ambiguity

## Related

- `docs/architecture/2026-04-08-debug-skill-v0.md`
- `docs/architecture/2026-04-08-debug-execution-v0.md`
- `docs/architecture/2026-04-08-debug-operating-procedure-v0.md`
- `docs/architecture/2026-04-08-shared-extra-capabilities-across-skill-repos-v0.md`
