---
name: cmon:review
description: Use after `cmon:verify`, or when explicitly needed, to run a broader multi-lens audit of an implemented change through product, engineering, and operations lenses.
---

# cmon:review

Review changes against intent, implementation quality, and operational reality when broader scrutiny is warranted.

This skill is central, but it is no longer the default immediate stage after every `cmon:work` pass.

It is not a generic "check my diff" prompt.

It should answer three different questions:

- Did we build the right thing?
- Did we build it well?
- What breaks outside the happy path?

## Operating Posture

This is an orchestrator skill.

Its job is to:

1. collect the right review inputs
2. dispatch the right reviewer agents
3. merge and de-duplicate findings
4. return a single actionable decision

It should not collapse into one monolithic review voice when the multi-lens pipeline is available.

## Required Review Lenses

Every substantial review must cover:

### Product

- Does the diff still match the approved problem framing?
- Is the solution over-built, under-built, or drifting?

### Engineering

- Is the implementation correct, bounded, and maintainable?
- Do the tests and verification actually support the claim?

### Operations

- What fails under configuration issues, retries, migrations, deployment, or partial failure?
- What hidden assumptions would bite in real usage?

## Inputs

Review should use all of the following when available:

1. The diff
2. The approved requirements/design artifact
3. The approved plan
4. Verification evidence from `cmon:work`
5. Verification summary from `cmon:verify` when one exists
6. Execution-boundary artifacts from `cmon:work`, especially a scope expansion request when one exists
7. The current `cmon:understand` packet when prior repo decisions or local patterns materially shape the review target

## Default Scope Resolution

When the user does not provide an explicit review target, review the current branch against the most likely base branch.

Use this order:

1. merge-base against `origin/main` if it exists
2. merge-base against `origin/master` if it exists
3. if neither exists, stop and ask the user which base ref to review against

Collect:

- base ref
- changed files
- diff
- untracked files, if they are relevant to the change under review

Do not silently review only the latest commit unless the user explicitly asked for that.

## Artifact Resolution

Before dispatching reviewers, identify the intent artifacts that define what "correct" means.

Use this order:

1. explicit paths provided by the user
2. plan or requirements/design doc clearly referenced in the current task context
3. the most recent likely-matching file in:
   - `docs/plans/`
   - `docs/brainstorms/`
   - `docs/architecture/` when the change is architectural

If no design/requirements or plan artifact can be found, continue review, but explicitly note reduced intent confidence in the final output.

## Verification Evidence Resolution

Look for verification evidence from the current work:

- test or build output already produced in the session
- verification notes attached to the current implementation unit
- explicit manual verification notes from `cmon:work`

If no evidence exists, do not fabricate it. Pass `verification evidence: none provided` to reviewers and let the engineering and operations lenses treat that as a real signal.

## Review Context Bundle

Build one shared review context bundle before dispatching reviewers.

Use `templates/review/reviewer-context-template.md` as the default structure.

When the review needs explicit invocation control, start from:

- `templates/review/review-run-manifest-template.md`

The bundle should contain:

- review target summary
- base ref
- changed files
- diff
- understand packet path and summary when relevant
- approved requirements/design artifact path and summary
- approved plan path and summary
- work execution report path
- scope expansion request path and summary when present
- verification evidence
- any known scope notes

## Workflow

### Stage 1: Determine scope

Collect:

- base ref
- file list
- diff
- untracked file note when relevant

If the review target needs explicit operator control, resolve it first through:

- `templates/review/review-run-manifest-template.md`

### Stage 2: Resolve intent artifacts

Locate:

- approved requirements/design artifact
- approved implementation plan
- verification evidence
- work execution report
- scope expansion request when present

If one or more are missing, continue, but record that explicitly in the review context bundle.

### Stage 3: Build the review context bundle

Assemble the shared context once.

Do not make each reviewer rediscover scope independently.

When a scope expansion request exists, include it in the shared bundle so reviewers can judge whether the widened review target still reflects one coherent unit.

### Stage 4: Dispatch lens reviewers

Dispatch these reviewers in parallel:

- `agents/review/product-reviewer.md`
- `agents/review/engineer-reviewer.md`
- `agents/review/ops-reviewer.md`

Each reviewer receives the same review context bundle.

Use `templates/review/lens-reviewer-invocation-template.md` as the default wrapper for each reviewer invocation so dispatch stays structurally consistent across lenses.

### Stage 5: Synthesize

After the three reviewer outputs return, dispatch:

- `agents/review/review-synthesizer.md`

Use `templates/review/synthesizer-input-template.md` as the default structure for what is passed in.

The synthesizer is responsible for:

- deduplicating overlapping issues
- preserving lens-specific reasoning
- keeping the more conservative severity and action class on disagreement
- producing the final decision

### Stage 6: Route the outcome

Interpret the synthesized result using this policy:

- `accepted`
  - stop, unless reusable learning should be captured

- `accepted_with_followup`
  - present the accepted state plus follow-up items

- `requires_fixes`
  - hand back to `cmon:work`

If the review uncovered reusable lessons or guardrails:

- recommend `cmon:compound`

## Finding Classes

Use these classes:

- `safe_auto`
  - unambiguous and low-risk to fix directly

- `gated`
  - likely right, but changes behavior or needs explicit approval

- `manual`
  - requires judgment, redesign, or a larger change

- `advisory`
  - worth noting, not blocking

In v0, `safe_auto` is a classification, not a separate auto-fix pipeline yet.

If a finding is marked `safe_auto`, present it as a low-risk fix candidate for the next `cmon:work` pass rather than trying to mutate automatically inside `cmon:review`.

## Output

Return:

- `Scope check`
- `Intent confidence`
- `Product findings`
- `Engineering findings`
- `Operations findings`
- `Merged actions`
- `Decision`

When reviewer agents are used, the output should be the synthesized result, not four raw reviewer dumps.

## Default Invocation Guidance

Use the reviewer prompts exactly for their lens:

- product reviewer checks alignment and scope
- engineer reviewer checks correctness and verification
- ops reviewer checks runtime and rollout risk

Do not let one reviewer absorb another reviewer's job.

## Hard Rules

- Do not review only the diff in isolation when requirements or plans exist
- Do not reduce review to correctness-only feedback
- Do not accept "verified" claims without looking at the evidence
- Do not let product or operations concerns disappear behind clean code
- Do not synthesize by averaging reviewer opinions, use conservative merge rules
- Do not treat missing requirements, missing plans, or missing verification evidence as invisible
- Do not return raw reviewer outputs as the final review when synthesis is available

## Handoff

Record the handoff using:

- `templates/workflow/stage-transition-decision-template.md`

Typical transition decisions:

- `revise -> cmon:work`
  - if changes are required

If accepted and reusable learning was created:

- `proceed -> cmon:compound`

If accepted and no compounding is needed:

- `proceed -> complete`

If review cannot responsibly judge the target because the artifact set or evidence base is insufficient:

- `block`
