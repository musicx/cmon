---
title: <plan title>
type: feat | fix | refactor
status: active
date: YYYY-MM-DD
origin: docs/brainstorms/<requirements-file>.md
---

# <Plan Title>

## Overview

[What is changing and why]

## Problem Frame

[Short restatement of the approved problem and intended outcome]

## Requirements Trace

- R1. [Requirement this plan satisfies]
- R2. [Requirement this plan satisfies]

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

## Recommended Next Step

- `cmon:work`
