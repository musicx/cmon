# cmon Workflow Proof Coverage v0

Date: 2026-04-07
Status: Draft

This document tracks which parts of the intended `cmon` workflow have already been proved by concrete end-to-end examples.

It exists to answer one practical question quickly:

- which workflow claims are already backed by repo artifacts, and which are still only design intent

## Current Proof Set

| Example | Main proof value | Notes |
|---|---|---|
| `docs/architecture/2026-04-07-e2e-example-core-skill-routing-matrix.md` | basic lifecycle closure | superseded for richer stage coverage, but still useful as the first full-chain run |
| `docs/architecture/2026-04-07-e2e-example-routing-matrix-refresh-v1.md` | explicit `design`, plan critique, mature `work`, and update-existing `compound` | proves the strongest normal-path docs-heavy flow |
| `docs/architecture/2026-04-07-e2e-example-stage-ownership-parallel-v1.md` | valid `parallel` execution with disjoint write scopes | proves docs-first `parallel` without runtime-heavy orchestration |
| `docs/architecture/2026-04-07-e2e-example-proof-coverage-scope-expansion-v1.md` | valid narrow scope expansion during `cmon:work` | proves that execution can stop, expand explicitly, and continue without silently drifting |
| `docs/architecture/2026-04-07-e2e-example-review-scope-expansion-handoff-v1.md` | less-doc-heavy `update_existing` compound flow | proves that templates and skill-contract work can still refresh existing knowledge rather than creating duplicate pattern docs |
| `docs/architecture/2026-04-08-e2e-example-debug-reroute-v0.md` | valid `work -> debug -> work` reroute | proves that blocked implementation can pause for root-cause clarification and return with a narrower justified move |

## What Is Now Proved

- the default lifecycle can run end to end
- `cmon:design` works as an explicit owner-led stage
- `cmon:plan` can be critiqued before work begins
- `cmon:work` can require execution strategy, verification, and internal review loops
- `parallel` is allowed only when write scopes are disjoint
- scope expansion can be handled explicitly without pretending the original unit was sufficient
- `cmon:debug` can serve as a bounded reroute surface when implementation uncertainty should be investigated before any fix
- `cmon:compound` can both create new pattern docs and update existing workflow learnings
- less-doc-heavy workflow mechanics changes can still drive valid `update_existing` compound behavior

## What Is Still Not Fully Proved

- a blocked execution example where work must stop without a safe narrow expansion
- a code-changing `parallel` example, if later evidence suggests the docs-first proof is too weak

## How To Use This Reference

- If a workflow capability is already listed above, prefer citing the proving example instead of treating the behavior as merely aspirational.
- If a capability is not yet listed above, treat the design docs as intent rather than as fully validated operating evidence.

## Related

- `docs/architecture/2026-04-07-core-skills-v0.md`
- `docs/architecture/2026-04-07-design-plan-work-v1-gap-list.md`
- `docs/architecture/2026-04-07-work-execution-v0.md`
