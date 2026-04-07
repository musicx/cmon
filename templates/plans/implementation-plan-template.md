---
title: <plan title>
type: feat | fix | refactor
status: active
date: YYYY-MM-DD
origin: docs/brainstorms/<requirements-file>.md
design: docs/designs/<design-file>.md | none
mode: create | deepen
deepened: YYYY-MM-DD | none
---

# <Plan Title>

## Overview

[What is changing and why]

## Problem Frame

[Short restatement of the approved problem and intended outcome]

## Requirements Trace

- R1. [Requirement this plan satisfies]
- R2. [Requirement this plan satisfies]

## Design Trace

- D1. [Design decision, flow, or boundary this plan preserves]
- D2. [Design decision, flow, or boundary this plan preserves]

## Scope Boundaries

- [Explicit non-goal]
- [Adjacent work intentionally excluded from execution]

## Relevant Context

### Existing Patterns

- [Existing file, component, or pattern to follow]

### Existing Constraints

- [Relevant repo rule, architectural constraint, or known invariant]

### Prior Learnings

- [Relevant `docs/solutions/` artifact, if any]

### Research Notes

- [Relevant local or external research result that shaped the plan]

## Key Technical Decisions

- [Decision]: [Rationale]
- [Decision]: [Rationale]

## Open Questions

### Resolved During Planning

- [Question]: [Resolution]

### Deferred To Execution

- [Question]: [Why it is intentionally deferred]

## Implementation Units

- [ ] **Unit 1: <Name>**

**Goal:** [What this unit accomplishes]

**Requirements:** [R1, R2]

**Dependencies:** [None / another unit / external prerequisite]

**Files:**
- Create: `path/to/file`
- Modify: `path/to/file`
- Test: `path/to/test_file`

**Constraints:**
- [Boundary or invariant this unit must respect]
- [What this unit must not expand into]

**Approach:**
- [Key design decision]
- [Key integration note]

**Patterns To Follow:**
- [Existing file, component, or convention]

**Execution Note:**
- [None | test-first | characterization-first | other bounded posture]

**Test Scenarios:**
- Happy path: [specific input/action and expected result]
- Edge case: [boundary condition and expected result]
- Failure path: [invalid input or downstream failure and expected result]
- Integration: [cross-layer scenario when applicable]

**Verification:**
- [Concrete proof that the unit is complete]

**Done When:**
- [Behavioral result]
- [Verification result]

- [ ] **Unit 2: <Name>**

**Goal:** [What this unit accomplishes]

**Requirements:** [R2, R3]

**Dependencies:** [Unit 1]

**Files:**
- Modify: `path/to/file`
- Test: `path/to/test_file`

**Constraints:**
- [Boundary or invariant]

**Approach:**
- [Key design decision]

**Patterns To Follow:**
- [Existing file, component, or convention]

**Execution Note:**
- [None | test-first | characterization-first | other bounded posture]

**Test Scenarios:**
- Happy path: [specific input/action and expected result]
- Edge case: [boundary condition and expected result]
- Failure path: [invalid input or downstream failure and expected result]

**Verification:**
- [Concrete proof]

**Done When:**
- [Behavioral result]

## Review Watchpoints

- [Product concern reviewers should check]
- [Engineering concern reviewers should check]
- [Operations concern reviewers should check]

## Risks

- [Meaningful risk]
- [Mitigation or fallback]

## Plan Critique Result

- Design consistency review: <not run | pass | revise>
- Engineering feasibility review: <not run | pass | revise>
- Scope and risk review: <not run | pass | revise>
- Readiness decision: <ready_for_work | revise_plan>

## Plan Quality Check

- Requirements covered: [yes | no]
- Design decisions preserved: [yes | no]
- Exact file paths named: [yes | no]
- Feature-bearing units have test scenarios: [yes | no]
- Execution boundaries are reviewable: [yes | no]
- Research shaped the plan where needed: [yes | no]
- Deferred questions are truly execution-owned: [yes | no]
- Critique stack cleared when needed: [yes | no | not_needed]

## Recommended Next Step

- `cmon:work`
