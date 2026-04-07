# cmon Core Skills v0

Date: 2026-04-07
Status: Draft

This document maps the first six `cmon` skills and the intended handoff between them.

## Canonical Skill Names

- `cmon:understand`
- `cmon:brainstorm`
- `cmon:plan`
- `cmon:work`
- `cmon:review`
- `cmon:compound`

## Lifecycle

```text
cmon:understand -> cmon:brainstorm -> cmon:plan -> cmon:work -> cmon:review -> cmon:compound
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

### `cmon:brainstorm`

Produces the approved requirements/design artifact:

- problem frame
- intended behavior
- scope boundaries
- success criteria
- key decisions
- lens-specific tradeoffs and blockers

### `cmon:plan`

Produces the implementation plan:

- implementation units
- files in scope
- dependencies
- verification
- unit-level constraints

### `cmon:work`

Produces the implementation result:

- code
- tests
- verification evidence
- review-relevant findings
- scoped execution artifacts when needed

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
| `cmon:brainstorm` | `docs/brainstorms/...` |
| `cmon:plan` | `docs/plans/...` |
| `cmon:work` | code + tests + verification evidence + scoped execution artifacts |
| `cmon:review` | merged review decision, may remain session-local in v0 |
| `cmon:compound` | `docs/solutions/...` or updated durable doc |

## Initial Policy

### Mandatory

- no substantial coding before `cmon:plan`
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

1. a manual operating procedure or lightweight local script for the `cmon:review` helper
2. an end-to-end example that proves the chain through `cmon:compound`
3. a second end-to-end example that exercises a larger or multi-file unit
