---
name: cmon:compound
description: Use after meaningful work to capture reusable knowledge in durable project artifacts so future planning, implementation, and review get easier.
---

# cmon:compound

Turn session learning into reusable project knowledge.

This is an orchestrator skill when the reusable-learning signal is real.

This skill exists because chat history is not a knowledge system.

If a bug, pattern, decision, or operational lesson is likely to matter again, it should survive the session in `docs/solutions/` or another durable doc.

## When to Use

Use this skill when one or more of these is true:

- the issue is likely to recur
- the fix required non-trivial investigation
- a new engineering or operations guardrail was discovered
- a prior assumption was corrected
- future planning or review would be better if this lesson were documented

Mandatory trigger policy is defined in:

- `docs/architecture/2026-04-07-compound-trigger-policy-v0.md`

Use `templates/compound/trigger-checklist-template.md` as the default trigger check.

## When Not to Use

Do not write a solution doc for every trivial edit.

This skill is for reusable learning, not for logging every completed task.

## Output Targets

Default target:

- `docs/solutions/`

Other valid targets when appropriate:

- `docs/architecture/` for stable repo-level design decisions
- existing docs that need to be updated rather than duplicated

Default templates:

- `templates/solutions/bug-solution-template.md` for solved bug or failure learnings
- `templates/solutions/pattern-solution-template.md` for reusable practices, patterns, and guardrails

Use `templates/compound/compound-context-template.md` as the default shared context shape for multi-role compounding.

## Workflow

### Stage 1: Run trigger check

Start from:

- `templates/compound/compound-run-manifest-template.md` when operator control is needed
- `templates/compound/trigger-checklist-template.md` to classify the signal as `mandatory`, `recommended`, or `skip`

### Stage 2: Build shared compound context

Assemble:

- completed work summary
- source artifacts
- trigger signals
- related existing solution docs

### Stage 3: Dispatch lens curators

Dispatch in parallel:

- `agents/compound/product-curator.md`
- `agents/compound/engineer-curator.md`
- `agents/compound/ops-curator.md`

Use `templates/compound/lens-invocation-template.md` as the default wrapper for each curator call.

### Stage 4: Synthesize the compound decision

Pass the shared context and curator outputs into:

- `agents/compound/compound-synthesizer.md`

Use `templates/compound/synthesizer-input-template.md` as the default synthesis structure.

### Stage 5: Write or update durable knowledge

Decide whether to:

- create a new bug doc
- create a new pattern doc
- update an existing doc
- skip if the signal is too weak

## Preferred Categories of Learning

- solved bug with reusable root cause
- implementation pattern worth reusing
- review rule discovered through failure
- operational constraint or rollout gotcha
- planning heuristic that should recur

## Hard Rules

- Do not ignore a `mandatory` trigger once it is established
- Do not create duplicates when an existing doc should be updated
- Do not write vague "we learned a lot" summaries
- Do not capture chat-only detail without explaining the reusable lesson
- Do not turn trivial work into noisy solution docs
- Do not collapse product, engineering, and operations learning into one unlabeled generic lesson when the multi-lens pipeline is available

## Handoff

After compounding:

- the work loop is complete
- future runs of `cmon:understand`, `cmon:brainstorm`, `cmon:plan`, and `cmon:review` should be able to discover the artifact
