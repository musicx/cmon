# cmon Design v0

Date: 2026-04-07
Status: Draft for discussion

## 1. Purpose

`cmon` is a new harness skill repository for `Codex` and `Claude` first.

The goal is not to clone an existing repo. The goal is to deliberately combine:

- the strict execution boundaries and implementation discipline of `superpowers`
- the planning, review, and knowledge-compounding philosophy of `compound-engineering`
- the pre-implementation critique and plan-tightening bar of `gstack`
- a lightweight enough repo structure that the system remains understandable and composable

`cmon` should help a coding agent do work that is:

- better framed before implementation
- more tightly bounded during implementation
- more rigorously reviewed before acceptance
- more reusable after completion

## Naming Convention

All exported core skill names must use the `cmon:` namespace.

The initial canonical names are:

- `cmon:understand`
- `cmon:think`
- `cmon:design`
- `cmon:plan`
- `cmon:work`
- `cmon:review`
- `cmon:compound`

Repo-internal folder names may remain filesystem-safe, but public skill names must keep the namespace.

Canonical internal implementation paths should follow the exported skill name when practical.
For v0 this means `templates/think/` and `agents/think/` are preferred over new `brainstorm/*` internals.

## 2. Problem Statement

Existing harness repos each solve only part of the problem:

- Some are strong at execution discipline but weak at knowledge compounding
- Some are strong at role-based review and knowledge capture but less strict during implementation
- Some are strong at full delivery runtime but bring a larger runtime system than desired
- Some intentionally relax constraints, which is not aligned with the current preference for `cmon`

The result is that no single existing repo matches the desired shape:

1. multi-role viewpoint is necessary
2. execution must stay tightly bounded
3. planning and knowledge capture must be mandatory, not optional
4. runtime-heavy tooling is not required for v0
5. model freedom should not outrank disciplined workflow in early versions

## 3. Design Goals

### 3.1 Primary Goals

1. **Codify a complete engineering loop**
   - repo understanding
   - `cmon:think`
   - `cmon:design`
   - `cmon:plan`
   - `cmon:work`
   - `cmon:review`
   - `cmon:compound`

2. **Make role separation explicit**
   - `product`, `engineering`, and `operations` are baseline perspectives, not optional decoration
   - But role separation should not be interpreted as "every stage is parallel multi-agent"

3. **Constrain implementation tightly**
   - implementation should be driven by approved plan boundaries
   - execution should be reviewable, testable, and resistant to drift

4. **Create reusable project knowledge**
   - solved problems and decisions should become future inputs

5. **Stay lightweight at the system level**
   - no runtime platform, no daemon, no heavy telemetry stack in v0

### 3.2 Secondary Goals

1. Support both `Codex` and `Claude` cleanly from the start
2. Keep the repo understandable enough that prompts, skills, and docs can be hand-audited
3. Make room for future expansion into more hosts, without optimizing for that yet

## 4. Explicit Non-Goals for v0

These are intentionally out of scope unless later approved:

1. Full runtime platform similar to `gstack`
2. Browser QA / visual automation / deploy orchestration
3. Marketplace-style multi-host conversion matrix
4. Minimal-constraint philosophy that treats model freedom as a primary value
5. Huge role catalogs from day one

## 5. Product Philosophy

`cmon` should be opinionated in three ways.

### 5.1 Process Before Code

Non-trivial work should not jump directly into implementation.

The system should first determine:

- what problem is being solved
- whether the scope is right
- what constraints matter
- what success looks like
- what risks and non-goals are already visible

### 5.2 Boundaries During Execution

The implementation phase is where agent drift is most expensive.

So `cmon` should deliberately enforce:

- approved scope before coding
- explicit files or modules in scope
- explicit verification targets
- no "while I'm here" feature creep
- no claiming completion without evidence

### 5.3 Every Meaningful Unit of Work Should Leave Residue

Work should leave useful artifacts behind:

- a clearer requirement
- a better plan
- a documented solution
- a sharper review rule
- a reusable guardrail

If work produces no durable residue, future work stays expensive.

## 6. Proposed Core Workflow

## 6.1 High-Level Lifecycle

`cmon:understand -> cmon:think -> cmon:design -> cmon:plan -> cmon:work -> cmon:review -> cmon:compound`

### `cmon:understand`

Purpose:

- scan repo context
- find existing conventions
- recover relevant prior solutions or plans

Output:

- short context summary
- relevant existing files / docs
- known constraints

### `cmon:think`

Purpose:

- act as the unified pre-design thinking stage
- pressure-test the problem framing
- generate candidate directions when the request is still open-ended
- compare approaches and clarify requirements when a direction exists
- examine the request from product, engineering, and operations viewpoints

Output:

- either:
  - a ranked direction set when the user is still choosing what to pursue
  - or an approved requirements document with explicit scope boundaries, success criteria, and blocking questions

### `cmon:design`

Purpose:

- convert approved requirements into a stable, reviewable design artifact
- make flows, states, interfaces, and ambiguity explicit before planning
- run a design quality pass strong enough that planning does not need to invent missing experience decisions

Output:

- design doc with:
  - user or system flow
  - states, failure handling, and operator experience
  - interface and boundary decisions
  - requirements trace
  - open questions that still block planning

### `cmon:plan`

Purpose:

- define how the approved requirements and design will be implemented

Output:

- implementation plan with:
  - files or modules in scope
  - existing patterns to follow
  - sequencing
  - dependencies
  - test scenarios
  - execution posture where needed
  - verification expectations
  - explicit boundaries and constraints

### `cmon:work`

Purpose:

- execute against the approved plan

Output:

- code and tests
- task progress
- any implementation-time findings that need review

### `cmon:review`

Purpose:

- validate the change from multiple lenses

Output:

- merged review findings
- required fixes
- acceptance decision or next revision

### `cmon:compound`

Purpose:

- capture what this work taught the system

Output:

- solution doc, pattern doc, or guardrail update

## 6.2 Workflow Invariants

These are meant to become hard rules in `cmon` skills.

1. No non-trivial implementation before approved design / requirements
2. No non-trivial implementation without an implementation plan
3. No completion claim without verification evidence
4. No substantial review using only one viewpoint
5. No meaningful solved problem should disappear into chat history
6. No plan should have to invent missing design decisions that should have been resolved earlier

## 7. Role Model

`cmon` should start with a small but explicit role set.

The important design principle is:

- multi-role coverage across the lifecycle is required
- symmetric multi-role parallelism at every stage is not

Different stages should use different collaboration patterns depending on what decision is being made.

## 7.1 Required Core Roles

### Product Lens

Questions:

- Is this solving the right problem?
- Is the scope right-sized?
- Are we over-building or under-building?
- Does the behavior align with user value?

Best used in:

- `cmon:think`
- owner-led or review support for `cmon:design`
- final review

### Engineering Lens

Questions:

- Is the architecture coherent?
- Are the interfaces and boundaries clear?
- Is the plan implementable and testable?
- Is the code maintainable and correct?

Best used in:

- repo understanding
- owner-led or review support for `cmon:design`
- `cmon:plan`
- implementation review

### Operations Lens

Questions:

- What breaks under deployment, migration, retries, misconfiguration, or partial failure?
- What assumptions fail outside the happy path?
- What operational constraints are invisible in local development?

Best used in:

- `cmon:think` for risky changes
- challenge and constraint input for `cmon:design`
- `cmon:plan` where rollout or failure realism matters
- `cmon:review`
- knowledge capture

## 7.2 Role Usage By Stage

### `cmon:understand`

Default pattern:

- multi-lens context recovery

Reason:

- repo context is easy to misread if only one viewpoint is loaded

### `cmon:think`

Default pattern:

- multi-lens exploration

Reason:

- this stage benefits from disagreement about direction quality, problem framing, scope, and tradeoffs

### `cmon:design`

Default pattern:

- owner-led design
- supporting challenge from non-owner lenses

Owner selection:

- `product-led` when the design problem is mainly about user flow, operator flow, UX, or behavior
- `engineering-led` when the design problem is mainly about interfaces, architecture, protocol, or system boundaries

Role of non-owner lenses:

- `engineering` should challenge feasibility, complexity, and boundary clarity when `product` leads
- `product` should challenge usability, clarity, and outcome alignment when `engineering` leads
- `operations` should challenge rollout realism, failure behavior, and misconfiguration handling

Non-goal:

- do not force three co-equal parallel drafts by default

### `cmon:plan`

Default pattern:

- engineering-owned

Reason:

- this stage is about implementation units, file scope, patterns, tests, verification, and sequencing
- product and operations should constrain the plan, not co-author it symmetrically

### `cmon:work`

Default pattern:

- engineering execution

Reason:

- bounded implementation quality depends on a clear execution owner
- other roles should re-enter through blockers, scope decisions, review, or compound capture

### `cmon:review`

Default pattern:

- multi-lens review

Reason:

- acceptance quality depends on product, engineering, and operations all having veto power over meaningful risks

### `cmon:compound`

Default pattern:

- multi-lens when the lesson has cross-role reuse value

Reason:

- many reusable lessons are not purely technical

## 7.3 Supporting Roles

These should likely appear early, but do not need to be first-class on day one.

### Repo Research

Purpose:

- understand local patterns, docs, architecture, tests, and conventions

### Review Synthesizer

Purpose:

- merge findings from multiple roles into one actionable review output

### Knowledge Curator

Purpose:

- convert session learnings into durable docs
- update stale docs when needed

## 7.4 Initial Role Count Recommendation

For v0, keep the active role set small:

1. repo-research
2. product-reviewer
3. engineer-reviewer
4. ops-reviewer
5. review-synthesizer
6. knowledge-curator

This is enough to prove the philosophy without exploding the system.

## 8. Execution Model

This is where `cmon` should be closest to `superpowers`.

## 8.1 Execution Posture

Implementation should be:

- bounded
- file-aware
- verification-aware
- hard to drift

The harness should favor explicit constraints over free-form improvisation.

## 8.2 Rules for Implementation Work

For non-trivial changes, the execution skill should require:

1. approved plan reference
2. stated scope for the current task or unit
3. explicit target files or modules
4. explicit verification approach
5. explicit stop condition

It should reject or challenge:

- unrelated refactor during implementation
- opportunistic scope expansion
- "done" without test or verification evidence
- broad unbounded edits

## 8.3 Recommended Unit of Work

`cmon` should probably not go as far as the most extreme micro-step scripting, but it should still keep implementation units small enough to be auditable.

Suggested standard:

- one implementation unit should produce one meaningful, testable result
- each unit should have:
  - goal
  - files
  - constraints
  - verification
  - completion criteria

This is stricter than generic planning, but less script-like than the most rigid `superpowers` plans.

## 8.4 Open Design Choice

There is still a decision to make:

- **Option A:** plans include step-level execution choreography
- **Option B:** plans stay as decision artifacts, while execution units hold the tighter constraints

Current recommendation:

- start with **Option B**
- keep plans cleaner
- push tighter bounds into execution-unit structure

This stays closer to `compound` for planning and `superpowers` for execution.

## 9. Review Model

Review is a core differentiator for `cmon`.

## 9.1 Review Philosophy

Review should not be:

- one generic code review prompt
- only correctness checking
- only bug finding

Review should be:

- multi-lens
- structured
- mergeable
- tied back to approved intent

## 9.2 Proposed Review Flow

1. collect diff and intended scope
2. dispatch product / engineering / operations reviewers
3. gather findings in structured form
4. synthesize:
   - duplicates
   - disagreements
   - severity
   - action owner
5. decide:
   - safe auto-fix
   - gated fix
   - manual change
   - advisory only

## 9.3 What Makes cmon Review Different

Compared with other repos, `cmon` should explicitly review against three things at once:

1. the actual diff
2. the approved design / requirements
3. the approved implementation plan

This helps catch:

- scope drift
- under-building against accepted requirements
- correct code applied to the wrong problem

## 10. Knowledge Compounding Model

This is where `cmon` should be closest to `compound-engineering`.

## 10.1 Principle

If the team learned something reusable, it must survive the session.

Examples:

- root cause and fix for a recurring bug
- pattern decision that future contributors should reuse
- operational gotcha
- planning rule
- review guardrail discovered from failure

## 10.2 Proposed Artifact Types

### `docs/brainstorms/`

Use for:

- requirement exploration
- problem framing
- scope decision records

### `docs/plans/`

Use for:

- technical plans
- work sequencing
- implementation units

### `docs/solutions/`

Use for:

- solved bugs
- reusable patterns
- pitfalls
- operational lessons

### `docs/architecture/`

Use for:

- stable repo architecture and workflow design

## 10.3 Knowledge Capture Trigger

`cmon` should write or update a knowledge artifact when at least one of these is true:

1. the issue is likely to recur
2. the solution required meaningful investigation
3. a new pattern or guardrail was established
4. a previous assumption was wrong
5. future planning or review would benefit from the lesson

## 10.4 Open Design Choice

Need to decide whether compounding should be:

- mandatory after every substantial task
- mandatory only when heuristics say new knowledge was created

Current recommendation:

- use the second option
- make compounding mandatory when triggered, not universal after every change

## 11. Host Strategy

## 11.1 v0 Host Scope

Target:

- `Codex`
- `Claude`

Not yet targeted:

- broad multi-host conversion
- marketplace packaging for many tools

## 11.2 Why This Is the Right Scope

This avoids solving the wrong problem too early.

The immediate problem is workflow and harness shape, not distribution infrastructure.

If the workflow is right, host expansion can happen later.
If the workflow is wrong, multi-host expansion just spreads bad design faster.

## 12. Proposed Repo Structure

Suggested starting structure:

```text
cmon/
  AGENTS.md
  README.md
  docs/
    architecture/
    brainstorms/
    designs/
    plans/
    solutions/
  skills/
    understand/        # exports cmon:understand
    brainstorm/        # deprecated alias for cmon:think
    think/             # exports cmon:think
    design/            # exports cmon:design
    plan/              # exports cmon:plan
    work/              # exports cmon:work
    review/            # exports cmon:review
    compound/          # exports cmon:compound
  agents/
    repo-research/
    review/
    knowledge/
  templates/
    brainstorm/
    plans/
    solutions/
```

This is intentionally simple.

It leaves room for:

- skill docs
- role prompts
- shared templates
- durable docs

without requiring a heavy generated runtime.

## 13. First Skill Set Recommendation

For v0, `cmon` should not ship a huge catalog.

Recommended first skills:

1. `cmon:understand`
   - repo understanding and context recovery

2. `cmon:think`
   - ideation, problem framing, and requirements clarification with product / engineering / operations lenses

3. `cmon:design`
   - explicit design decisions before planning

4. `cmon:plan`
   - implementation planning with explicit boundaries

5. `cmon:work`
   - bounded execution against approved plan

6. `cmon:review`
   - multi-role review and synthesis

7. `cmon:compound`
   - solution and pattern capture

This is enough to express the complete philosophy.

## 14. Phased Implementation Plan

## Phase 1: Foundation

Deliverables:

- project structure
- root guidance docs
- architecture doc
- initial templates for think / design / plan / solution docs

## Phase 2: Core Workflow Skills

Deliverables:

- `cmon:understand`
- `cmon:think`
- `cmon:design`
- `cmon:plan`

Goal:

- define how work should enter the system

## Phase 3: Bounded Execution

Deliverables:

- `cmon:work`
- execution unit template
- verification policy

Goal:

- make implementation disciplined

## Phase 4: Multi-Role Review

Deliverables:

- `product-reviewer`
- `engineer-reviewer`
- `ops-reviewer`
- `review-synthesizer`
- `cmon:review`

Goal:

- make review central, not incidental

## Phase 5: Knowledge Compounding

Deliverables:

- `cmon:compound`
- `knowledge-curator`
- `docs/solutions/` schema and templates

Goal:

- ensure work compounds

## 15. Key Decisions Made in This Draft

1. `Codex/Claude` first, not multi-host first
2. strict execution boundaries are part of the core identity
3. planning and compounding are mandatory parts of the workflow
4. product / engineering / operations are the initial mandatory lenses
5. runtime-heavy gstack-style system design is out of scope for v0
6. Waza-style loosened constraint philosophy is explicitly not the current direction

## 16. Open Questions for Discussion

These are the main decisions still worth debating before implementation starts.

1. How fine-grained should execution units be?
2. Should `plan` stay clean and push bounds into `work`, or should the plan itself become more script-like?
3. What exact structure should review findings use?
4. What should trigger mandatory knowledge capture?
5. Should repo understanding be its own user-facing skill, or always a hidden first step?
6. How much subagent parallelism should v0 assume?

## 17. Current Recommendation

Build `cmon` as a **disciplined workflow repo with explicit role separation and mandatory knowledge capture**, not as a runtime platform.

Concretely:

- keep the host scope narrow
- keep the workflow explicit
- keep implementation tightly bounded
- make review multi-role by default
- treat knowledge capture as part of the product, not aftercare

That is the cleanest first version aligned with the stated preferences.
