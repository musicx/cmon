# Example Understand Packet

Task: add a compact routing reference that tells operators which `cmon:*` skill to use next, what it requires, and what it produces.

## Relevant Area

- Summary: The task lives in the workflow-definition layer of `cmon`, especially the docs that define the six core skills and their handoffs.
- Candidate Paths:
  - `AGENTS.md`
  - `docs/architecture/2026-04-07-core-skills-v0.md`
  - `docs/architecture/2026-04-07-artifact-templates-v0.md`
  - `skills/understand/SKILL.md`
  - `skills/brainstorm/SKILL.md`
  - `skills/plan/SKILL.md`
  - `skills/work/SKILL.md`
  - `skills/review/SKILL.md`
  - `skills/compound/SKILL.md`

## Existing Artifacts

- Path: `AGENTS.md`
  - Why It Matters:
    - Product: captures the intended position of `cmon`
    - Engineering: defines the canonical lifecycle and constraints
    - Operations: confirms runtime-heavy orchestration is out of scope for v0

- Path: `docs/architecture/2026-04-07-core-skills-v0.md`
  - Why It Matters:
    - Product: defines what each core skill is supposed to achieve
    - Engineering: already names artifact flow and lifecycle order
    - Operations: sets the expectation that bounded flow matters more than runtime tooling

- Path: `docs/architecture/2026-04-07-artifact-templates-v0.md`
  - Why It Matters:
    - Product: shows which artifacts already exist for each stage
    - Engineering: reveals where routing confusion is likely to happen
    - Operations: indicates which stages still depend on explicit manifests and procedure docs

## Local Patterns And Constraints

- `cmon` prefers short, operational docs over large manifesto-style prose once design intent is already captured.
- Core skill names are always namespaced as `cmon:*`.
- The repo already separates stages by durable artifacts, so a routing matrix should reflect stage boundaries rather than invent new concepts.
- v0 favors discipline over flexibility, so the doc should emphasize entry checks and legal next steps.

## Open Questions

- Should the routing reference be architecture-facing or operator-facing? Current context points to operator-facing.
- Should it duplicate all skill details? No. Existing docs already hold deep detail; this doc should stay compact.

## Recommended Next Step

- `cmon:brainstorm`
- Reason: the task is clear enough to be small, but it still needs one pass to decide the right shape, scope boundary, and artifact style.
