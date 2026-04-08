# cmon Understand Packet: Routing Matrix Refresh

Date: 2026-04-07
Status: Draft

## Task Summary

Refresh the operator-facing routing surfaces so they reflect the newer `cmon` execution model:

- explicit `cmon:design`
- `cmon:plan` critique stack
- `cmon:work` execution strategy selection
- `cmon:work` system interaction checks

## Relevant Repo Area

- `docs/architecture/2026-04-07-core-skill-routing-matrix-v0.md`
- `docs/architecture/2026-04-07-core-skills-v0.md`
- `docs/architecture/2026-04-07-design-plan-work-v1-gap-list.md`
- `skills/plan/SKILL.md`
- `skills/work/SKILL.md`
- `docs/solutions/workflow/operator-facing-routing-matrix-for-core-skills-2026-04-07.md`

## Current State

- The routing matrix still reflects the earlier chain shape and does not mention:
  - `cmon:plan` critique
  - `cmon:work` execution strategy
  - `cmon:work` system interaction checks
- The existing workflow pattern doc is still useful, but it describes the earlier, lighter routing surface.

## Local Patterns

- Operator-facing reference docs stay concise and table-driven.
- Architecture example artifacts for `cmon` are stored in `docs/architecture/`.
- Durable reusable workflow lessons live in `docs/solutions/workflow/`.

## Constraints

- Keep `cmon:*` lifecycle order unchanged.
- Do not imply runtime automation or heavy orchestration.
- Keep the routing doc operator-facing rather than turning it into a second skill spec.

## Open Questions

- Should the routing matrix surface `plan critique` and `work` preflight inline, or only in entry checks?
- How much example/proof material should be updated to preserve multi-surface parity?
