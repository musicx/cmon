---
title: review handoff for scope expansion evidence
type: requirements
status: active
date: 2026-04-07
---

# Review Scope Expansion Handoff Requirements

## Problem

`cmon:work` can now record explicit scope expansion, but `cmon:review` does not yet require that artifact in its input contract. That means a widened unit can arrive at review without the reviewer seeing why the boundary still counts as coherent.

## Requirements

- R1. `cmon:review` must accept work execution artifacts, including scope-expansion requests when present.
- R2. The review manifest and shared review context must have explicit places for those artifacts.
- R3. The review execution docs must explain why those artifacts matter.
- R4. The existing narrow-scope-expansion pattern doc should be refreshed rather than duplicated.

## Success Criteria

- reviewers can see the work report and scope-expansion request in one packet
- the solution pattern is updated in place, not forked into a duplicate doc
