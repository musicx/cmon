# Challenge Lens Invocation

## Challenger Lens

- Lens: <product | engineering | operations>
- Challenge Mode: <design | package>
- Challenger Prompt Path: <agents/challenge/...>

## Invocation Objective

Challenge the proposed artifact package from this lens only.

Stay inside your assigned role.
Do not absorb the responsibilities of the other challengers.

Use mode-specific semantics:

- `design`: challenge the design artifact before `human_design_approval`
- `package`: challenge approved design, Markdown plan, and execution JSON before `human_package_approval`

## Shared Challenge Context

[Paste the challenge context bundle here]

## Output Contract

Return findings using the `cmon` challenge schema:

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

- Challenge against the provided intent artifacts, not against imagined alternatives
- Treat missing design, plan, or context as real challenge signals
- For `package` mode, treat missing or mismatched execution JSON as a real challenge signal
- Do not perform synthesis here; synthesis belongs to `challenge-synthesizer`
