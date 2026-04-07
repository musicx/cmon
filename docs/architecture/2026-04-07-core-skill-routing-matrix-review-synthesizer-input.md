# Synthesizer Input

## Review Context

[See `docs/architecture/2026-04-07-core-skill-routing-matrix-review-context.md`]

## Product Reviewer Output

[See `docs/architecture/2026-04-07-core-skill-routing-matrix-product-review.md`]

## Engineer Reviewer Output

[See `docs/architecture/2026-04-07-core-skill-routing-matrix-engineering-review.md`]

## Ops Reviewer Output

[See `docs/architecture/2026-04-07-core-skill-routing-matrix-ops-review.md`]

## Synthesis Task

Merge these outputs using the `cmon` review pipeline rules:

- deduplicate by issue, not wording
- keep the more conservative severity on disagreement
- keep the more conservative action class on disagreement
- preserve lens-specific reasoning
- produce one final decision
