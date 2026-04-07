# cmon Foundation Alignment: superpowers, compound-engineering, gstack

Date: 2026-04-07
Status: Draft

This document defines how `cmon` should align its foundational skill contracts with `superpowers`, `compound-engineering`, and `gstack` across the critical path:

- `cmon:think`
- `cmon:design`
- `cmon:plan`
- `cmon:work`

The goal is not to imitate every workflow detail from those systems.
The goal is to absorb the strongest capability-level expectations:

- what each step is responsible for
- what each step must output
- what each step must refuse to do
- what quality bar must be met before the next step

This alignment also makes one governance choice explicit:

- multi-role coverage is required across the lifecycle
- symmetric multi-role parallelism is not required at every stage

## 1. Synthesis

### What `superpowers` contributes

- Hard gates before coding
- Explicit approval before moving forward
- Strong execution boundaries
- Evidence-before-claims

### What `compound-engineering` contributes

- Right-sized durable artifacts
- Requirements and plan separation
- Research before structuring
- Traceability, test scenarios, and plan deepening
- Execution that treats plans as decision artifacts, not scripts

### What `gstack` contributes

- Pre-implementation critique loops
- Design and plan quality gates strong enough to revise artifacts before coding
- Explicit focus on user outcome, not just engineering neatness
- A bias toward completeness when the marginal implementation cost is low

### What `cmon` chooses

`cmon` should be:

- as strict as `superpowers` about boundaries and verification
- as structured as `compound-engineering` about artifact quality and knowledge flow
- as demanding as `gstack` about pre-implementation critique quality

`cmon` should not:

- inherit `superpowers` step-by-step code choreography in plans
- inherit `gstack`'s runtime, telemetry, or delivery stack
- blur requirements, design, and implementation planning into one document

## 2. Step-Level Alignment

| Step | Target capability to absorb | `cmon` decision |
|---|---|---|
| Think | `superpowers` hard gate, `compound-engineering` ideate plus brainstorm split, and `gstack` product pressure test | `cmon:think` owns direction finding, problem framing, scope shaping, alternatives, and approved requirements. It must not drift into implementation planning. |
| Design | `superpowers` approved design expectation, `gstack` design review bar, `compound-engineering` artifact discipline | `cmon:design` becomes explicit. It is owner-led by default, not symmetric three-way co-authoring. It owns flows, states, interfaces, ambiguity removal, and design quality gating before planning. |
| Plan | `compound-engineering` research, traceability, and deepening plus `gstack` critique mentality and `superpowers` bounded units | `cmon:plan` is engineering-owned. It must produce exact-file, bounded implementation units with patterns, test scenarios, execution note, verification, and self-checks. |
| Work | `superpowers` no-drift execution and verification, `compound-engineering` plan-aware execution and review posture | `cmon:work` is engineering execution. It must execute one bounded unit, honor execution posture, stop on drift, verify continuously, and hand off cleanly to review. |

## 2.1 Collaboration Pattern By Step

- `cmon:think`
  - multi-lens by default

- `cmon:design`
  - owner-led by default
  - `product-led` for experience, UX, workflow, and operator-surface design
  - `engineering-led` for interfaces, architecture, and system-boundary design
  - other lenses challenge and constrain

- `cmon:plan`
  - engineering-owned
  - product and operations inputs remain constraints, not co-equal authorship

- `cmon:work`
  - engineering execution
  - non-engineering roles re-enter at blockers, review, and compound capture

## 3. Contracts By Step

### `cmon:think`

Responsibilities:

- generate candidate directions when the request is still open-ended
- assess whether brainstorming is needed
- recover minimal repo context before questioning
- pressure-test the problem framing
- propose alternatives when a real choice exists
- produce approved requirements with stable IDs

Must do:

- ask one question at a time when interactive
- resolve product and scope decisions here
- keep implementation details out unless the brainstorm is inherently architectural
- right-size the artifact instead of forcing ceremony

Must not do:

- code
- plan files, modules, or shell steps
- silently collapse product questions into engineering assumptions

Quality gate:

- the requirements artifact must make success criteria, scope boundaries, and `Resolve Before Planning` items explicit
- if blocking ambiguity remains, handoff to planning is invalid

### `cmon:design`

Responsibilities:

- turn approved requirements into a design artifact
- define the flow, states, interfaces, and experience choices that planning should not invent
- make ambiguity visible before implementation planning starts

Default ownership:

- `product-led` when the problem is mainly about user or operator experience
- `engineering-led` when the problem is mainly about architecture or interface behavior

Must do:

- trace back to requirements
- specify important states such as loading, empty, error, partial success, and operator-visible failures when relevant
- record boundary decisions that would otherwise haunt the implementer
- run a design quality pass before handoff
- gather challenge from non-owner lenses when they materially affect quality

Must not do:

- exact file breakdown
- code or pseudo-code that is really implementation
- treat planning as the place where missing design decisions get improvised

Quality gate:

- no unresolved design ambiguity that materially changes implementation shape
- design scorecard dimensions should be explicit and revised until they are strong enough for planning

### `cmon:plan`

Responsibilities:

- convert approved requirements and design into a bounded implementation plan
- research repo patterns and prior learnings before locking structure
- define implementation units that an executor can trust

Default ownership:

- engineering-owned

Must do:

- preserve requirements and design traceability
- name exact file paths
- include patterns to follow
- include test scenarios and verification
- carry execution posture when test-first or characterization-first is warranted
- self-check for coverage, placeholders, and vague test guidance

Must not do:

- pre-write production code
- turn the plan into shell choreography
- invent user behavior or design decisions that belong upstream

Quality gate:

- every feature-bearing unit has explicit test scenarios
- every unit is bounded enough to execute without adjacent drift
- no major requirement or design decision is untraced

### `cmon:work`

Responsibilities:

- execute one approved unit against explicit boundaries
- use the plan as a decision contract
- produce verification evidence and a clean review handoff

Default ownership:

- engineering execution

Must do:

- read the unit critically before coding
- honor `Execution note` when present
- follow referenced patterns before inventing new shape
- stop on scope drift and record expansion explicitly
- run fresh verification before any completion claim
- include a self-review pass before handoff

Must not do:

- invent adjacent scope because it seems convenient
- claim success without fresh evidence
- trust that tests are implied if the plan forgot to be concrete

Quality gate:

- evidence exists for the unit's verification contract
- scope integrity is explicit
- open findings are surfaced for `cmon:review` instead of buried in chat

## 4. Resulting Repository Changes

This alignment implies these foundational choices for `cmon`:

1. `cmon:design` is now explicit rather than hidden inside brainstorm or plan.
2. Requirements, design, and implementation plan remain separate artifacts.
3. Plans must carry `Patterns To Follow`, `Test Scenarios`, and `Execution Note` fields.
4. Work execution must trace back to requirements, design, and plan rather than only "the current task".
5. Quality gates must live inside the skill contracts, not only in architecture docs.
6. Multi-role coverage is enforced across the lifecycle, but `design` is owner-led and `plan/work` are engineering-owned.
7. `cmon:think` is the canonical pre-design thinking skill, with `ideate`, `brainstorm`, and `fast-path` as internal modes.

## 5. Explicit Non-Alignment

`cmon` is intentionally not aligning to:

- `gstack` runtime, telemetry, update system, deploy chain, or browser stack
- `superpowers` fully choreographed code snippets inside plan steps
- a single giant artifact that merges requirements, design, plan, and execution

## 6. Immediate Follow-Up

The next high-value follow-up after this alignment pass is:

- define the lightweight challenge pattern for owner-led `cmon:design`
- refresh the end-to-end example so the chain includes `cmon:design`
- then evaluate whether plan-quality review should run as a dedicated `cmon` skill or remain embedded inside `cmon:plan`
