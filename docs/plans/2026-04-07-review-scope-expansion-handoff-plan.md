---
title: review handoff for scope expansion evidence
type: docs
status: active
date: 2026-04-07
origin: docs/brainstorms/2026-04-07-review-scope-expansion-handoff-requirements.md
design: docs/designs/2026-04-07-review-scope-expansion-handoff-design.md
mode: create
deepened: none
---

# Review Scope Expansion Handoff Plan

## Overview

Teach review packets to include scope-expansion evidence and refresh the existing scope-expansion pattern doc accordingly.

## Implementation Units

- [ ] **Unit 1: Add scope-expansion evidence to review inputs and refresh the existing pattern doc**

**Files:**
- Modify: `templates/review/review-run-manifest-template.md`
- Modify: `templates/review/reviewer-context-template.md`
- Modify: `skills/review/SKILL.md`
- Modify: `docs/architecture/2026-04-07-review-execution-v0.md`
- Modify: `docs/architecture/2026-04-07-review-runner-helper-v0.md`
- Modify: `docs/architecture/2026-04-07-review-pipeline-v0.md`
- Modify: `docs/solutions/workflow/narrow-scope-expansion-when-unit-goal-stays-fixed-2026-04-07.md`

**Constraints:**
- keep the new review input surface small
- do not duplicate the entire work packet inside review
- update the existing solution doc instead of creating a new one

**Execution Note:**
- `inline`

**Verification:**
- confirm the two review templates now have explicit work-execution-artifact fields
- confirm the review skill and execution docs mention scope-expansion evidence
- confirm the existing solution doc now includes review handoff guidance

## Recommended Next Step

- `cmon:work`
