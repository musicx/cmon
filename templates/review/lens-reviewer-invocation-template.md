# Lens Reviewer Invocation

## Reviewer Lens

- Lens: <product | engineering | operations>
- Reviewer Prompt Path: <agents/review/...>

## Invocation Objective

Review the change from this lens only.

Stay inside your assigned role. Do not absorb the responsibilities of the other reviewers.

## Shared Review Context

[Paste the review context bundle here]

## Output Contract

Return findings using the `cmon` review schema:

- Finding
- Severity
- Action Class
- Owner
- Confidence
- Why It Matters
- Evidence
- Recommended Action

If there are no findings, say so explicitly rather than inventing weak feedback.

## Guardrails

- Review against the provided intent artifacts, not the diff alone
- Treat missing requirements, plan, or verification evidence as real review signals
- Do not downgrade uncertainty into confidence
- Do not perform synthesis here; synthesis belongs to `review-synthesizer`
