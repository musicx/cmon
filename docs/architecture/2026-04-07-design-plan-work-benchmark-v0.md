# cmon Benchmark: design, plan, work vs superpowers, compound-engineering, gstack

Date: 2026-04-07
Status: Draft

This document compares `cmon`'s current `design`, `plan`, and `work` capabilities against the strongest corresponding capabilities found in:

- `superpowers`
- `compound-engineering`
- `gstack`

The goal is not to score entire repos.
The goal is to compare capability contracts at the step level:

- what the step is supposed to do
- how it is supposed to do it
- what it must refuse to do
- how it keeps execution aligned with approved intent
- where `cmon` is already stronger
- where `cmon` is still weaker or incomplete

## 1. Scope And Source Set

This benchmark uses the following source artifacts as the primary comparison set.

### cmon

- `skills/design/SKILL.md`
- `skills/plan/SKILL.md`
- `skills/work/SKILL.md`

### superpowers

- `repoes/skills/superpowers/skills/brainstorming/SKILL.md`
- `repoes/skills/superpowers/skills/writing-plans/SKILL.md`
- `repoes/skills/superpowers/skills/executing-plans/SKILL.md`
- `repoes/skills/superpowers/skills/subagent-driven-development/SKILL.md`

### compound-engineering

- `~/.codex/skills/ce-brainstorm/SKILL.md`
- `~/.codex/skills/ce-plan/SKILL.md`
- `~/.codex/skills/ce-work/SKILL.md`
- `~/.codex/skills/ce-ideate/SKILL.md`

### gstack

- `repoes/skills/gstack/plan-design-review/SKILL.md`
- `repoes/skills/gstack/design-consultation/SKILL.md`
- `repoes/skills/gstack/plan-eng-review/SKILL.md`
- `repoes/skills/gstack/autoplan/SKILL.md`
- `repoes/skills/gstack/design-html/SKILL.md`
- `repoes/skills/gstack/qa/SKILL.md`
- `repoes/skills/gstack/ship/SKILL.md`

## 2. Comparison Frame

These repos are not isomorphic.

- `superpowers` is strongest when it turns workflow into hard gates and tight execution choreography.
- `compound-engineering` is strongest when it creates durable artifacts, research-backed plans, and portable execution discipline.
- `gstack` is strongest when it adds critique loops, plan review pressure, and delivery-completion workflows.
- `cmon` is trying to selectively combine these, not clone any one of them.

This means some comparisons are asymmetric:

- `gstack` does not expose one clean generic `work` step equivalent to `cmon:work`.
- `superpowers` does not separate `requirements`, `design`, and `plan` as cleanly as `cmon`.
- `compound-engineering` is structurally closest to `cmon` on `plan` and `work`, but weaker on explicit `design` as a first-class stage.

Where the comparison is asymmetric, this document says so explicitly rather than forcing a false one-to-one mapping.

## 3. Executive Synthesis

### 3.1 Where `cmon` is already ahead

- `cmon` has the cleanest conceptual split between `think`, `design`, `plan`, and `work`.
- `cmon` has the clearest current statement that `design` is distinct from both requirements and planning.
- `cmon:work` has a strong purity of boundary, especially around approved unit execution, fresh verification, and explicit stop-on-drift.

### 3.2 Where `cmon` is closest to the target repo quality bar

- `cmon:plan` is already closest to `compound-engineering` in spirit and should continue using it as the main reference shape.
- `cmon:work` already shares the right philosophy with `superpowers`, even though it does not yet match its enforcement and review-loop maturity.
- `cmon:design` now has a stronger stage definition and a first owner-led challenge mechanism, though it still needs proof through richer examples and continued refinement.

### 3.3 Where `cmon` is still behind

- `cmon:plan` now has research and deepening support, but it is still missing the critique stack that makes `ce:plan` and `gstack` plans more resilient.
- `cmon:work` now has a first internal review loop, but it is still missing execution-strategy maturity and stronger system-interaction checks from `superpowers` and `ce:work`.
- `cmon:design` now has its first execution layer, but it still lacks an explicit end-to-end proof case and later helper support.

### 3.4 Main recommendation

Use this blended target:

- `design`: keep `cmon`'s explicit stage split, add owner-led challenge loops modeled more after `gstack` quality gates than `superpowers` collaboration ceremony
- `plan`: align the base contract with `ce:plan`, then add a smaller `gstack`-style critique layer
- `work`: keep `cmon`'s bounded-unit core, then add `superpowers`-style review loops and `ce:work`-style execution strategy selection

## 4. Capability Benchmark: Design

### 4.1 `cmon` current state

`cmon:design` currently says:

- design is a distinct stage after approved requirements and before implementation planning
- it exists to define flows, states, boundaries, interfaces, and ambiguity that planning should not invent
- it is owner-led by default
- `product-led` is the default for user or operator experience work
- `engineering-led` is the default for architecture and interface behavior work
- non-owner roles challenge and constrain rather than co-author in parallel

Current strengths:

- clear stage identity
- strong refusal to let planning invent missing design
- correct owner-led default
- explicit quality gate dimensions
- first operational owner-led challenge flow
- clear split between owner drafting and non-owner challenge

Current weakness:

- the operational machinery is still earlier and lighter than `review`
- the new challenge flow has not yet been exercised by a stronger end-to-end example
- later helper support and refinement may still be needed

### 4.2 `superpowers` equivalent capability

`superpowers` has no clean standalone `design` stage.
Its relevant behavior is mainly inside `brainstorming`.

What it does well:

- forces design before coding with a hard gate
- requires multiple approaches and tradeoff discussion
- requires user approval before implementation
- writes a durable design doc and self-reviews it

What it does less well for `cmon`'s purposes:

- requirements, design, and some implementation-adjacent thinking are bundled together
- stage boundaries are less explicit
- it is interaction-heavy and ceremony-heavy
- the browser-based visual companion is useful for some flows but too heavy for `cmon` v0

Interpretation:

- `superpowers` is stronger than `cmon` at enforcing that design cannot be skipped
- `cmon` is stronger than `superpowers` at saying what design is, and what it is not

### 4.3 `compound-engineering` equivalent capability

`compound-engineering` does not treat `design` as an explicit standalone first-class stage.

Its relevant strength lives in:

- strong requirements artifacts in `ce:brainstorm`
- enough product clarity that planning does not need to invent behavior casually
- clear separation between requirements and implementation planning

What it does well:

- keeps behavior and scope definition upstream
- discourages implementation detail leakage into the requirements doc
- includes optional visual aids when they help clarify user flows

What it does less well for `cmon`'s design goal:

- no separate design owner stage
- no explicit default for owner-led design drafting
- no separate design challenge or approval protocol

Interpretation:

- `compound-engineering` is good at reducing the need for design invention later
- `cmon` is better positioned structurally because it explicitly names design as its own gate

### 4.4 `gstack` equivalent capability

`gstack` is strongest here, but in a different shape than `cmon`.

Its relevant abilities are:

- `plan-design-review`
- `design-consultation`
- `design-html`

What it does well:

- treats design quality as something that can and should be reviewed before implementation
- applies explicit critique pressure to plan-level design quality
- cares about user experience, design system coherence, and the user's lived outcome
- tends to revise artifacts until they are good enough, not merely "present"

What it does less well for `cmon`'s use:

- it is not a minimal, generic owner-led design contract
- part of the ecosystem assumes richer runtime or browser-assisted workflows
- some of its strongest value comes from design-specific surface areas, not general-purpose behavior design

Interpretation:

- `gstack` has the best critique bar for design quality
- `cmon` should borrow the review mentality and explicit quality dimensions, not the heavier runtime or visual tooling assumptions

### 4.5 Design benchmark verdict

| Dimension | cmon | superpowers | compound-engineering | gstack |
|---|---|---|---|---|
| Stage separation clarity | strongest | weak | medium | medium |
| Hard no-skip gate | medium | strongest | medium | medium |
| Owner-led default | strongest | weak | weak | medium |
| Design quality critique | medium | medium | weak | strongest |
| Lightweightness | strong | medium | strong | weak-medium |

### 4.6 Design recommendation

Keep `cmon:design` as a standalone owner-led stage.
Do not collapse it back into `think`, and do not turn it into symmetric three-role co-authoring.

Improve it by adding:

1. a formal owner-led challenge pattern
2. a design approval loop
3. explicit challenger prompts for engineering and operations
4. a scorecard or gate strong enough that planning cannot begin while design ambiguity remains

The thing to borrow from:

- `superpowers`: hard no-skip discipline
- `gstack`: critique bar and revision-until-clear mentality
- not the heavy browser or design-runtime layer

## 5. Capability Benchmark: Plan

### 5.1 `cmon` current state

`cmon:plan` currently says:

- it consumes approved requirements and design, or already-clear behavior
- it produces bounded implementation units
- each unit must include files, constraints, patterns, test scenarios, verification, and done conditions
- planning must not invent missing design decisions
- the result should be strong enough to safely constrain `cmon:work`

Current strengths:

- correct emphasis on traceability
- correct emphasis on bounded units
- correct emphasis on exact file paths, patterns, test scenarios, and verification
- strong refusal to let planning become free-form or improv-heavy

Current weakness:

- research behavior is not yet as developed as `ce:plan`
- the deepening path is newer and lighter than `ce:plan`
- the critique stack is smaller than the more mature `gstack` review gauntlet
- there is not yet a mature distinction between simple planning and more rigorous plan gauntlet modes

### 5.2 `superpowers` equivalent capability

`superpowers` uses `writing-plans`.

What it does well:

- extremely explicit decomposition
- exact file paths
- extremely fine-grained tasking
- very low executor ambiguity
- strong TDD bias

What it does less well for `cmon`'s purposes:

- it often turns planning into execution choreography
- the plan can become too script-like
- the carrying cost of plan maintenance is high
- it reduces executor judgment so far that the plan can stop being a decision artifact and become a pseudo-runbook

Interpretation:

- `superpowers` is strongest at reducing ambiguity for executors
- but it overshoots for `cmon`, which wants bounded plans without turning them into code-by-proxy

### 5.3 `compound-engineering` equivalent capability

`ce:plan` is the closest structural match to what `cmon:plan` wants to be.

What it does well:

- uses upstream requirements as source of truth
- does local research before structuring
- conditionally does external research
- preserves requirements traceability
- names exact file paths and test file paths
- carries test scenarios and verification explicitly
- supports plan depth and deepening
- keeps plans portable rather than tied to a single executor runtime
- allows lightweight execution posture signals instead of whole-script choreography

What it does less well for `cmon`'s purposes:

- it is more operationally mature than `cmon`, but also more complex
- some of its planning flow is broader than `cmon` currently needs
- it still relies on later execution and review layers to tighten some guarantees

Interpretation:

- `ce:plan` should be the primary reference baseline for `cmon:plan`

### 5.4 `gstack` equivalent capability

`gstack` is strongest not at base plan authoring, but at plan critique and escalation of quality.

Its relevant abilities are:

- `plan-eng-review`
- `plan-design-review`
- `autoplan`

What it does well:

- pressure-tests plans before implementation
- strengthens architecture, edge cases, and user-outcome thinking
- runs multi-pass critique loops
- assumes the plan should be revised until stronger, not merely accepted as-is

What it does less well for `cmon`'s purposes:

- it is not the cleanest baseline plan format
- some of its tone and ambition model are productively opinionated, but heavier than `cmon` needs as a default
- it is better as a review layer on top of a plan than as the base shape of the plan

Interpretation:

- `gstack` should inform `cmon`'s plan review layer, not replace the base `cmon:plan` contract

### 5.5 Plan benchmark verdict

| Dimension | cmon | superpowers | compound-engineering | gstack |
|---|---|---|---|---|
| Bounded implementation units | strong | strongest | strong | medium |
| Research before structuring | weak-medium | weak | strongest | medium |
| Requirements/design trace | strong | medium | strongest | medium |
| Plan portability | strong | weak | strongest | medium |
| Plan critique depth | weak-medium | weak | medium | strongest |
| Over-specification risk | low | highest | medium | medium |

### 5.6 Plan recommendation

Keep `cmon:plan` centered on the `compound-engineering` model.
That should be the main shape.

Add three things:

1. `ce:plan`-style research and deepening behavior
2. a smaller `gstack`-style critique stack
3. a firm rejection of `superpowers`-style micro-step execution choreography as the default

The right blend is:

- from `compound-engineering`: source-of-truth planning, research, traceability, portable bounded units
- from `gstack`: plan critique, design review, feasibility tightening
- from `superpowers`: only the insistence that unit boundaries be crisp, not the five-minute step scripting

## 6. Capability Benchmark: Work

### 6.1 `cmon` current state

`cmon:work` currently says:

- work only executes approved plan units
- scope, files, constraints, patterns, verification target, and stop condition must be explicit
- scope expansion must be recorded
- fresh evidence is required before completion claims
- implementation must hand off cleanly to review

Current strengths:

- very clear boundary discipline
- strong refusal of hidden scope drift
- correct focus on evidence-before-claims
- good separation between work, review, and compound

Current weakness:

- execution strategy selection is still thin
- the internal review loop is still newer and lighter than the mature reference systems
- no mature orchestration for serial vs parallel unit execution
- no strong "system-wide interaction check" equivalent yet

### 6.2 `superpowers` equivalent capability

The relevant pair is:

- `executing-plans`
- `subagent-driven-development`

What it does well:

- execution is tightly bound to plan structure
- fresh subagent per task reduces context drift
- spec compliance review happens before code quality review
- issues must be fixed before moving on
- the workflow strongly resists executor improvisation

What it does less well for `cmon`'s purposes:

- the implementation mode assumes a much more choreographed plan input
- it can feel heavy for smaller bounded units
- it is opinionated around a subagent-first execution pattern that `cmon` may want as one mode rather than the only mode

Interpretation:

- `superpowers` is the best reference for enforcement and review-loop structure inside execution

### 6.3 `compound-engineering` equivalent capability

`ce:work` is the closest execution system to `cmon:work` in general-purpose shape.

What it does well:

- can start from a plan or a bare prompt
- triages complexity
- chooses execution strategy
- supports inline, serial subagent, and parallel subagent execution
- checks test discovery and system-wide interaction risk
- uses incremental commits and quality tiers
- treats plans as decision artifacts, not scripts

What it does less well for `cmon`'s purposes:

- direct bare-prompt execution is more permissive than `cmon` wants
- it optimizes for real-world completion flexibility, not maximum upstream gating
- it is broader than `cmon`'s intentionally strict `approved unit only` posture

Interpretation:

- `ce:work` should inform execution strategy and verification depth
- but `cmon` should reject its more permissive direct-entry modes

### 6.4 `gstack` equivalent capability

`gstack` does not really define a single generic `work` skill in the same sense.

Its relevant execution-adjacent power comes from:

- `design-html`
- `qa`
- `ship`

What it does well:

- pushes work toward actually usable and shippable outcomes
- cares about QA, shipping, and final user-visible quality
- adds strong downstream completion layers

What it does less well for `cmon`'s purposes:

- it is not a bounded implementation-unit execution contract
- it assumes a broader delivery toolkit and runtime ecosystem
- it is better interpreted as downstream delivery and validation workflows than as the base definition of implementation

Interpretation:

- `gstack` should not define `cmon:work`
- it should instead inform optional downstream capabilities after `work`, such as QA or ship-readiness

### 6.5 Work benchmark verdict

| Dimension | cmon | superpowers | compound-engineering | gstack |
|---|---|---|---|---|
| Approved-unit boundary discipline | strong | strongest | medium-strong | weak |
| Execution strategy maturity | weak-medium | medium | strongest | weak |
| Review loops inside execution | medium | strongest | medium | weak |
| Fresh verification bar | strong | strong | strong | medium-strong |
| Delivery completion tooling | weak | medium | medium | strongest |

### 6.6 Work recommendation

Keep `cmon:work` strict.
Do not let it become a broad "just execute the request" skill.

Add:

1. execution strategy selection:
   - inline
   - serial delegated units
   - parallel delegated units when units are disjoint
2. deepen the new `superpowers`-style two-stage review loop:
   - spec or plan compliance review
   - code quality review
3. `ce:work`-style system-wide interaction checks for callbacks, middleware, retries, and other non-local effects

Do not add:

- gstack-style runtime-heavy delivery concerns into `cmon:work` itself
- bare-prompt direct execution as a first-class path

## 7. Cross-Capability Comparison

### 7.1 What all three repos agree on

- pre-implementation work matters
- the agent should not just jump straight into code for meaningful work
- durable artifacts improve later stages
- review or critique before execution raises quality
- execution without verification is weak

### 7.2 What they disagree on

- how explicit planning should become
- how much of execution should be orchestrated by subagents
- whether design deserves its own stage
- how much runtime, tooling, and delivery surface belongs in the harness

### 7.3 `cmon`'s desired position

`cmon` should sit here:

- more explicit than `compound-engineering` about design as a first-class stage
- less choreographed than `superpowers` on the plan artifact itself
- stricter than `compound-engineering` about approved-unit execution boundaries
- lighter than `gstack` on runtime and delivery stack
- willing to borrow `gstack`'s critique mentality without importing its whole operational envelope

## 8. Final Recommendations

### Recommendation 1: Keep `design` separate

Do not collapse `design` into `think` or `plan`.
This is one of `cmon`'s strongest structural choices.

### Recommendation 2: Make `design` operationally stronger

Add:

- owner draft
- engineering challenge
- operations challenge
- owner revision
- approval gate

That is the smallest mechanism that matches your philosophy.

### Recommendation 3: Base `plan` on `ce:plan`, not on `superpowers`

The default `cmon:plan` target should be:

- research-backed
- traceable
- portable
- bounded

It should not become a step-by-step coding script.

### Recommendation 4: Keep the plan review stack small and sharp

`cmon:plan` should keep the pre-work critique layer influenced by `gstack`, but avoid turning it into a heavy runtime:

- design consistency review
- engineering feasibility review
- scope and risk review

### Recommendation 5: Make `work` stricter through review loops, not through more prose

The highest-value upgrade for `cmon:work` is not more explanation.
It is operational enforcement:

- strategy selection
- spec compliance review
- code quality review
- rework loop until both pass

### Recommendation 6: Keep gstack-style delivery layers downstream

QA, ship-readiness, browser validation, and deploy-oriented workflows should not redefine `cmon:work`.
If added later, they should sit after bounded implementation and review, not replace them.

## 9. Outcome

If `cmon` follows this benchmark, the intended v1 shape is:

- `design` better defined than the reference repos
- `plan` closest in spirit to `compound-engineering`, but with stronger critique
- `work` closer in discipline to `superpowers`, but without inheriting its over-scripted planning model

That combination best matches the project goals currently encoded in:

- `AGENTS.md`
- `docs/2026-04-07-cmon-design-v0.md`
- `docs/architecture/2026-04-07-foundation-alignment-superpowers-ce-gstack.md`
