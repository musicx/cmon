# cmon Review Execution v0

Date: 2026-04-07
Status: Draft

This document turns the `cmon` review model into an executable orchestration flow.

It is the bridge between:

- the review philosophy
- the reviewer agent prompts
- the `cmon:review` skill
- the review runner helper contract

## 1. Execution Stages

### Stage 1: Scope Resolution

If operator intent needs to be made explicit before inference, start from:

- `templates/review/review-run-manifest-template.md`

Collect:

- base ref
- changed files
- diff
- untracked file note when relevant

Default base selection order:

1. `origin/main`
2. `origin/master`
3. ask the user if neither exists

### Stage 2: Artifact Resolution

Locate:

- approved requirements/design artifact
- approved implementation plan
- verification evidence

If any are missing, record that explicitly rather than hiding the gap.

### Stage 3: Shared Review Context Bundle

Build one shared bundle using:

- `templates/review/reviewer-context-template.md`

This prevents reviewer drift and keeps all lenses anchored to the same scope.

### Stage 4: Parallel Lens Review

Dispatch in parallel:

- `product-reviewer`
- `engineer-reviewer`
- `ops-reviewer`

Each receives the same review context bundle.

Wrap each dispatch using:

- `templates/review/lens-reviewer-invocation-template.md`

This keeps the reviewer call structure stable even if the runtime wrapper changes later.

### Stage 5: Synthesis

Pass the shared bundle plus all three reviewer outputs into:

- `review-synthesizer`

Use:

- `templates/review/synthesizer-input-template.md`

### Stage 6: Outcome Routing

Apply the final decision:

- `accepted`
- `accepted_with_followup`
- `requires_fixes`

If reusable knowledge was created, route to:

- `cmon:compound`

If fixes are required, route to:

- `cmon:work`

## 2. v0 Policy Choice

`safe_auto` findings are only classified in v0.

They are **not** automatically applied inside `cmon:review` yet.

Reason:

- there is no dedicated fixer pipeline yet
- keeping review read-mostly is simpler for the first operational version

So the v0 behavior is:

- classify `safe_auto`
- present them as low-risk fix candidates
- let `cmon:work` handle the actual mutation

## 3. What Was Borrowed From Mature Systems

From `compound-engineering`:

- structured multi-reviewer pipeline
- conservative synthesis
- diff + plan/requirements + verification as combined review inputs

From `superpowers`:

- strong comparison against plan/requirements
- emphasis on clear verdict and production readiness

## 4. What cmon Intentionally Does Differently

- no giant persona matrix in v0
- no auto-fix subpipeline yet
- no runtime-heavy review infrastructure
- mandatory product, engineering, and operations lenses even in the first version

## 5. Next Step

The next useful upgrade after this is:

- either a manual operating procedure for the review helper
- or a lightweight local script that renders the helper packets
- or the first execution helper for `cmon:work` to consume synthesized review output directly

The helper contract is now defined in:

- `docs/architecture/2026-04-07-review-runner-helper-v0.md`
