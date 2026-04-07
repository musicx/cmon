---
title: <clear design title>
status: draft
date: YYYY-MM-DD
origin: docs/brainstorms/<requirements-file>.md
---

# <Clear Design Title>

## Problem Frame

[Short restatement of the approved problem and intended outcome]

## Design Goals

- [Goal tied to user, operator, or system experience]
- [Goal tied to clarity, safety, or maintainability]

## Requirements Trace

- R1. [Requirement carried forward]
- R2. [Requirement carried forward]

## Flow

[Describe the user or system flow. Use prose, table, or diagram when it improves clarity.]

## States And Failure Handling

- [Loading / empty / success / partial success / error / retry behavior as relevant]
- [What the operator or user sees when things go wrong]

## Interfaces And Boundaries

- [Important interface boundary]
- [What is inside scope versus delegated to another surface]

## Key Design Decisions

- [Decision]: [Why it was chosen]
- [Decision]: [What alternative was rejected]

## Operational Considerations

- [Rollout, retry, migration, configuration, or failure-mode concern that affects design]

## Open Questions

### Resolve Before Planning

- [Question that changes implementation shape enough to block planning]

### Deferred To Planning

- [Question that can responsibly be answered during planning]

## Design Quality Gate

- Flow clarity: [strong | weak | needs revision]
- State completeness: [strong | weak | needs revision]
- Boundary clarity: [strong | weak | needs revision]
- User or operator clarity: [strong | weak | needs revision]
- Operability realism: [strong | weak | needs revision]
- Ambiguity left for implementer: [acceptable | too high]

## Next Step

- `cmon:plan` when `Resolve Before Planning` is empty and ambiguity is acceptable
- resume `cmon:design` when design blockers remain
