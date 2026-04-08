# cmon Stage Ownership Routing v0

Date: 2026-04-07
Status: Draft

This document is the shortest durable reference for how collaboration patterns change across the `cmon` lifecycle.

It exists to prevent one recurring mistake:

- seeing "multi-role coverage is required" and incorrectly translating that into "every stage should run as symmetric parallel co-authorship"

`cmon` requires multiple lenses across the workflow.
It does not require the same collaboration pattern at every stage.

## Routing Table

| Skill | Default Collaboration Pattern | Primary Owner | Non-owner Role | Do Not Confuse It With |
|---|---|---|---|---|
| `cmon:understand` | multi-lens | shared | add missing context and challenge blind spots | planning or review |
| `cmon:think` | multi-lens | shared | shape framing, tradeoffs, and scope | design drafting or implementation planning |
| `cmon:design` | owner-led | `product` or `engineering` depending on design type | challenge, constrain, and force ambiguity into the open | three-way co-authoring by default |
| `cmon:plan` | engineering-owned | `engineering` | provide constraints, not parallel authorship | product strategy work or design invention |
| `cmon:work` | engineering execution | `engineering` | re-enter only through blockers, scope decisions, or later review | multi-role co-execution |
| `cmon:challenge` | multi-lens | shared synthesis | challenge design / plan quality before implementation from product, engineering, and operations | single-owner pre-work signoff |
| `cmon:verify` | engineering-led | implementation acceptance | confirm the implemented unit still matches approved design / plan and meets engineering quality expectations | treating code as accepted before evidence and review |
| `cmon:compound` | multi-lens when reuse crosses roles | shared synthesis | decide what lesson is worth preserving | logging every trivial change |

## Quick Heuristic

Use this shortcut when routing a real task:

- If the problem is still being framed, use a multi-lens stage.
- If the repo needs one behavior or boundary truth, use an owner-led or engineering-owned stage.
- If code is being changed, default to engineering execution with explicit bounds.
- If acceptance or reusable learning is being decided, bring the other lenses back in.

## Why The Split Matters

The split keeps two different goals from colliding:

- `cmon` still gets product, engineering, and operations coverage across the lifecycle.
- `cmon` does not force unnecessary parallelism into design, plan, or work where it would mostly create coordination overhead.

This is the collaboration model that best matches the repo's current synthesis of:

- `compound-engineering` style multi-lens thinking and compounding
- `gstack` style critique and quality gates
- `superpowers` style bounded execution

## Related

- `AGENTS.md`
- `docs/architecture/2026-04-07-core-skills-v0.md`
- `docs/solutions/workflow/operator-facing-routing-matrix-for-core-skills-2026-04-07.md`
