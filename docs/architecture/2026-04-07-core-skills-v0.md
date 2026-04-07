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
- `cmon:work`
- `cmon:review`
- `cmon:compound`

## Lifecycle

```text
cmon:understand -> cmon:think -> cmon:design -> cmon:plan -> cmon:work -> cmon:review -> cmon:compound
```

Not every task needs the full chain, but this is the default path for substantial work.

## Skill Roles

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
- resolved and still-open design decisions

Default collaboration pattern:

- owner-led
- `product-led` for experience-heavy design
- `engineering-led` for architecture and interface-heavy design

### `cmon:plan`

Produces the implementation plan:

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

### `cmon:work`

Produces the implementation result:

- code
- tests
- verification evidence
- review-relevant findings
- scoped execution artifacts when needed

Default collaboration pattern:

- engineering execution

### `cmon:review`

Produces the acceptance decision:

- product findings
- engineering findings
- operations findings
- merged actions
- accept / revise decision

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
| `cmon:plan` | `docs/plans/...` |
| `cmon:work` | code + tests + verification evidence + scoped execution artifacts |
| `cmon:review` | merged review decision, may remain session-local in v0 |
| `cmon:compound` | `docs/solutions/...` or updated durable doc |

## Initial Policy

### Mandatory

- no substantial coding before `cmon:plan`
- no substantial planning when design ambiguity still blocks implementation decisions
- no substantial review without product / engineering / operations lenses
- no completion claim without evidence
- no reusable lesson left undocumented when the compound trigger is met

### Intentionally Deferred

- runtime automation layer
- browser QA chain
- deployment orchestration
- broad multi-host conversion

## Next Implementation Layer

The next iteration should add:

1. refresh the end-to-end example so it exercises the explicit `cmon:design` stage
2. add execution strategy selection to `cmon:work`
3. add stronger system-interaction checks to `cmon:work`
4. exercise the new `cmon:plan` critique stack and `cmon:work` review loop in a richer example

Detailed comparison and prioritization live in:

- `docs/architecture/2026-04-07-design-plan-work-benchmark-v0.md`
- `docs/architecture/2026-04-07-design-plan-work-v1-gap-list.md`
