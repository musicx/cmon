# Research Summary

## Source Artifacts

- `docs/architecture/2026-04-07-core-skill-routing-matrix-v0.md`
- `docs/architecture/2026-04-07-core-skills-v0.md`
- `docs/architecture/2026-04-07-design-plan-work-v1-gap-list.md`
- `skills/plan/SKILL.md`
- `skills/work/SKILL.md`
- `docs/solutions/workflow/operator-facing-routing-matrix-for-core-skills-2026-04-07.md`

## Recovered Patterns

- Routing docs stay short, table-driven, and explicit about bounce-back conditions.
- Mature workflow changes are usually summarized in architecture docs first, then reflected in operator-facing references.
- `cmon` avoids introducing new stages when a tighter gate belongs inside an existing stage.

## Key Planning Implications

- The routing matrix is stale enough that updating only one file would create parity drift.
- The reusable workflow pattern doc is part of the user-facing workflow surface and must stay aligned.
- The richer example summary should also reflect the refreshed routing surface, otherwise the repo will still present the older example as the dominant proof case.
