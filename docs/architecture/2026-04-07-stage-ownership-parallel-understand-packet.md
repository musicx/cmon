# Understand Packet

## Task Summary

Add a compact stage-ownership routing reference and surface it across the minimum repo surfaces operators actually use.

## Relevant Repo Area

- `AGENTS.md`
- `docs/architecture/2026-04-07-core-skills-v0.md`
- `docs/architecture/2026-04-07-design-plan-work-v1-gap-list.md`
- `docs/solutions/workflow/operator-facing-routing-matrix-for-core-skills-2026-04-07.md`

## Current State

- Stage ownership policy already exists, but it is spread across long-form docs.
- Operators can infer the collaboration split, but they cannot scan it quickly.
- The repo still lacks a proof case showing when `parallel` execution is actually acceptable.

## Key Constraints

- Keep the new ownership reference compact.
- Do not turn ownership guidance into a new lifecycle stage.
- Do not imply that every stage should run in parallel.
- If `parallel` is used in the example, the write scopes must be disjoint.

## Likely Next Skills

- `cmon:think`
- `cmon:design`

## Open Questions

- Which surfaces actually need the new ownership truth, and which should only link to it?
- Can the work be split into a valid `parallel` shape without creating parity drift?
