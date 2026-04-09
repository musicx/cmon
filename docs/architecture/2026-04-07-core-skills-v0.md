# cmon Core Skills v0

Date: 2026-04-07
Status: Draft

This document maps the current core `cmon` skills and the intended handoff between them.
It now also records the explicit design split added after the initial v0 chain.

## Canonical Skill Names

- `cmon:understand`
- `cmon:think`
- `cmon:design`
- `cmon:plan`
- `cmon:challenge`
- `cmon:work`
- `cmon:verify`
- `cmon:compound`

## Supporting Workflow Skill

- `cmon:debug`
  - auxiliary investigation surface for root-cause-first debugging before any fix attempt
- `cmon:pressure-test`
  - deprecated compatibility alias for `cmon:challenge`
- `cmon:review`
  - deprecated compatibility alias for older workflows that still mean pre-work multi-role challenge
- `cmon:refresh-knowledge`
  - auxiliary maintenance surface for stale, overlapping, or duplicated durable knowledge
- `cmon:revalidate`
  - auxiliary periodic audit surface for artifact trust, lifecycle drift, and narrow GC routing
- `cmon:worktree`
  - auxiliary isolation surface for deciding when work should stay, branch, or use a dedicated worktree

## Lifecycle

```text
cmon:understand -> cmon:think -> cmon:design -> cmon:challenge(mode=design) -> human_design_approval -> cmon:plan -> cmon:challenge(mode=package) -> human_package_approval -> cmon:work -> cmon:verify -> cmon:compound
```

Not every task needs the full chain, but this is the default path for substantial work.
`human_design_approval` and `human_package_approval` are conceptual approval gates recorded in `docs/approvals/`, not skills.
They are hard human gates.
Agents may record explicit user decisions, but must not approve or waive on behalf of the user.

## Skill Roles

Detailed ownership routing lives in:

- `docs/architecture/2026-04-07-stage-ownership-routing-v0.md`

### `cmon:understand`

Produces the context packet:

- relevant repo area
- existing artifacts
- local patterns
- constraints
- open questions
- role-separated context when needed

### `cmon:think`

Produces the pre-design thinking output:

- a ranked direction set when ideation is needed
- or an approved requirements artifact when a direction is being clarified
- problem frame
- intended behavior
- scope boundaries
- success criteria
- alternatives and recommendation
- lens-specific tradeoffs and blockers

### `cmon:design`

Produces the approved design artifact:

- user or system flow
- states and failure handling
- interface and boundary decisions
- requirements trace
- human review summary covering what, why, and interaction behavior
- tables, Mermaid diagrams, flowcharts, state diagrams, or graphs when useful for auditability
- resolved and still-open design decisions

Default collaboration pattern:

- owner-led
- `product-led` for experience-heavy design
- `engineering-led` for architecture and interface-heavy design

Mandatory trigger examples:

- greenfield projects
- new user-facing CLI, API, UI, or operator surfaces
- work that introduces persistence, config, storage, or multiple workflows
- cases where planning would otherwise invent behavior or boundary truth

### `cmon:plan`

Produces the implementation package:

- human-readable Markdown implementation plan
- required machine-readable execution JSON
- implementation units
- files in scope
- patterns to follow
- dependencies
- test scenarios
- execution note when posture matters
- verification
- unit-level constraints

Default collaboration pattern:

- engineering-owned

### `cmon:challenge`

Produces the pre-approval challenge judgment.

`cmon:challenge` has two canonical modes:

- `mode=design`
  - runs after `cmon:design`
  - challenges whether the design artifact is strong enough for `human_design_approval`
- `mode=package`
  - runs after `cmon:plan`
  - challenges whether the approved design, Markdown plan, and execution JSON are aligned and strong enough for `human_package_approval`

Common outputs:

- product challenge findings
- engineering challenge findings
- operations challenge findings
- merged proceed / revise / block decision

Default collaboration pattern:

- multi-lens challenge

### `cmon:work`

Produces the implementation result:

- code
- tests
- execution JSON task status and completion evidence updates
- verification evidence
- delegated execution packet when strategy is not inline
- unit checkpoint when execution state should stay inspectable
- review-relevant findings
- scoped execution artifacts when needed

Default collaboration pattern:

- engineering execution

### `cmon:verify`

Produces the verification judgment:

- claim under test
- evidence used
- gaps still visible
- accept / revise decision with explicit reflow guidance when the root cause is upstream

### `cmon:debug`

Produces the debugging handoff:

- precise symptom statement
- reproduction status
- evidence gathered
- concrete hypothesis
- confirmed root cause or best current failure boundary
- narrow next-action recommendation

### `cmon:compound`

Produces the reusable learning artifact:

- solution doc
- pattern doc
- guardrail update
- update-existing decision when prior knowledge is stale

## Artifact Flow

| Skill | Primary durable artifact |
|---|---|
| `cmon:understand` | none by default, context only |
| `cmon:think` | `docs/brainstorms/...` |
| `cmon:design` | `docs/designs/...` |
| `cmon:challenge(mode=design)` | explicit design challenge judgment and routing decision |
| `human_design_approval` | `docs/approvals/...` |
| `cmon:plan` | `docs/plans/...md` plus `docs/plans/...execution.json` |
| `cmon:challenge(mode=package)` | explicit package challenge judgment and routing decision |
| `human_package_approval` | `docs/approvals/...` |
| `cmon:work` | code + tests + execution JSON updates + verification evidence + scoped execution artifacts |
| `cmon:verify` | explicit verification judgment, commit hash or commit blocker, and routing decision |
| `cmon:compound` | `docs/solutions/...` or updated durable doc |

Current workflow proof coverage lives in:

- `docs/architecture/2026-04-07-workflow-proof-coverage-v0.md`

Shared handoff decisions should use:

- `docs/architecture/2026-04-07-stage-transition-contract-v0.md`
- `templates/workflow/stage-transition-decision-template.md`

## Initial Policy

### Mandatory

- no substantial coding before `cmon:plan`
- no substantial planning when design ambiguity still blocks implementation decisions
- no planning from a challenged design until `human_design_approval` exists
- no substantial work before the design / plan / execution JSON package has survived `cmon:challenge(mode=package)` and `human_package_approval`
- no treating agent-authored approval requests as human approvals
- no `approved` or `waived_by_user` approval artifact without an exact user approval or waiver quote
- no `cmon:plan` output without a matching execution JSON
- no `cmon:work` execution without consuming and updating the approved execution JSON task state
- no implementation claim accepted without an explicit verify pass
- no accepted verify pass without a git commit hash or explicit commit blocker
- no completion claim without evidence
- no reusable lesson left undocumented when the compound trigger is met

### Intentionally Deferred

- runtime automation layer
- browser QA chain
- deployment orchestration
- broad multi-host conversion

## Next Implementation Layer

The next iteration should focus on:

1. dogfood the current workflow on real non-`cmon` tasks before widening the system further
2. consider light helper automation for `cmon:challenge` only if repeated manual use proves worthwhile
3. consider light helper automation for `cmon:refresh-knowledge` only if repeated maintenance work proves worthwhile
4. add more proof-only examples only if later evidence shows the current proof set is too optimistic

Detailed comparison and prioritization live in:

- `docs/architecture/2026-04-07-design-plan-work-benchmark-v0.md`
- `docs/architecture/2026-04-07-design-plan-work-v1-gap-list.md`
- `docs/architecture/2026-04-07-next-opportunities-and-decisions-v0.md`
- `docs/architecture/2026-04-07-stage-transition-contract-v0.md`
- `docs/architecture/2026-04-07-auxiliary-skill-invocation-policy-v0.md`
- `docs/architecture/2026-04-07-handoff-and-artifact-gc-analysis-v0.md`
- `docs/architecture/2026-04-08-shared-extra-capabilities-across-skill-repos-v0.md`
- `docs/architecture/2026-04-08-debug-skill-v0.md`
- `docs/architecture/2026-04-08-worktree-skill-v0.md`
- `docs/architecture/2026-04-08-verify-skill-v0.md`
- `docs/architecture/2026-04-08-challenge-skill-v0.md`
- `docs/architecture/2026-04-08-repo-foundation-gate-v0.md`
- `docs/architecture/2026-04-08-work-stage-benchmark-v0.md`
