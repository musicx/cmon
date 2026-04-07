# cmon Think Skill Optimization v0

Date: 2026-04-07
Status: Accepted, implementing

## 1. Goal

Replace `cmon:brainstorm` with `cmon:think`.

The purpose is not just a rename.
The purpose is to merge two adjacent but currently separate behaviors into one pre-design thinking skill:

- idea generation and direction finding
- scope shaping and requirements clarification

This follows the useful split seen in `compound-engineering` between `ce:ideate` and `ce:brainstorm`, but chooses a different product decision:

- keep the cognitive distinction
- do **not** expose it as two separate top-level `cmon` skills

## 2. Why Change

### 2.1 What is good in compound-engineering

`ce:ideate` and `ce:brainstorm` separate two different jobs clearly:

- `ideate`: "What are the strongest directions worth exploring?"
- `brainstorm`: "What exactly should this selected direction mean?"

That distinction is real and useful.

### 2.2 Why `cmon` should still unify them

For `cmon`, keeping them as two separate user-facing skills adds more routing burden than value.

The operator usually wants one thing:

- "help me think this through before design and planning"

They do not always know whether they are:

- generating candidate directions
- refining a chosen direction
- checking whether enough clarity already exists to skip deeper thinking

So `cmon` should keep the internal distinction, but collapse the external entrypoint into:

- `cmon:think`

## 3. Source Repos and What To Keep

### 3.1 From compound-engineering

Keep:

- ideation and clarification as distinct internal modes
- strong trigger language
- right-sized artifacts
- grounding in actual repo context before generating ideas
- routing into requirements rather than straight into code

Do not copy:

- two separate top-level user-facing skills
- extra surface area when one orchestrator can route internally

### 3.2 From gstack `office-hours`

Keep:

- strong trigger surface for vague product ideas and "is this worth building?" style requests
- pressure-testing the idea before converging
- explicit mode thinking
- user-outcome focus instead of purely technical framing

Do not copy:

- gstack runtime assumptions
- telemetry, proactive config, or browser/runtime integrations
- startup/founder voice as a hard identity for `cmon`

### 3.3 From superpowers brainstorming

Keep:

- hard gate before implementation
- one-question-at-a-time discipline
- explicit alternative comparison
- design/spec approval before planning

Do not copy:

- the local HTML/browser-based visual companion
- interactive browser-heavy brainstorm surface

That feature is too heavy for `cmon` v0 and is not necessary for the harness design goal.

## 4. Proposed Product Decision

Adopt:

- `cmon:think`

Deprecate:

- `cmon:brainstorm`

Internal behavior of `cmon:think` should route into one of three paths:

1. `ideate`
2. `brainstorm`
3. `fast-path clarify-and-route`

## 5. Internal Modes

### 5.1 Mode A: `ideate`

Use when the user is primarily asking:

- what should we build
- what should we improve
- what directions are worth exploring
- surprise me with ideas
- is this worth building

Behavior:

- scan local context first
- generate multiple grounded directions
- critique and reduce the candidate set
- rank or recommend the strongest few
- only deepen one direction into requirements if the user chooses one

Primary output:

- ideation artifact or compact ranked option set

Normal next step:

- stay in `cmon:think` and switch to `brainstorm` mode on the chosen direction

### 5.2 Mode B: `brainstorm`

Use when the user already has a direction, but needs to define:

- what exactly the thing means
- scope boundaries
- alternatives and recommendation
- success criteria
- requirements clear enough for design or planning

Behavior:

- recover relevant context
- ask focused questions
- compare meaningful approaches
- resolve product decisions
- write approved requirements

Primary output:

- requirements artifact

Normal next step:

- `cmon:design` or `cmon:plan`

### 5.3 Mode C: `fast-path clarify-and-route`

Use when the request is already clear enough that full brainstorm ceremony is not needed.

Behavior:

- validate clarity
- write the minimum durable artifact if useful
- route quickly to `cmon:design` or `cmon:plan`

Primary output:

- compact requirements note or direct routing decision

Normal next step:

- `cmon:design` or `cmon:plan`

## 6. Trigger Strategy

`cmon:think` should absorb the strongest trigger patterns from `ce:ideate`, `ce:brainstorm`, and `gstack` `office-hours`.

### 6.1 Trigger `ideate` mode when the user says things like:

- what should we build
- what should I improve
- give me ideas
- ideate on this
- surprise me
- is this worth building
- what would you change

### 6.2 Trigger `brainstorm` mode when the user says things like:

- let's brainstorm
- help me think through X
- I want to build X but scope is unclear
- which approach should we take
- refine this idea
- define the requirements

### 6.3 Trigger `fast-path` when:

- the expected behavior is already concrete
- scope boundaries are explicit
- success criteria are already usable
- the operator mostly needs a durable handoff into design or planning

## 7. Artifact Strategy

The skill is unified, but artifacts do not need to collapse into one generic blob.

### Recommendation

Keep two artifact shapes under one skill:

- ideation artifact for `ideate` mode
- requirements artifact for `brainstorm` mode

### Path recommendation

Option A, preferred for v0.1:

- keep `docs/brainstorms/` for requirements artifacts
- add `docs/ideation/` only if ideation artifacts become common enough to justify it
- otherwise allow lightweight ideation artifacts to stay session-local unless explicitly preserved

Reason:

- lower migration cost
- avoids renaming artifact trees before the skill contract is stable

Option B, later if desired:

- rename artifact surfaces to `docs/thinks/`

Reason not recommended now:

- creates more churn than value
- renames paths before the workflow shape is stable

## 8. Recommended Skill Contract

`cmon:think` should answer:

- what possible directions are worth attention
- what selected direction should mean
- whether there is enough clarity to move into design or planning

`cmon:think` should not answer:

- detailed technical design
- file-level implementation breakdown
- execution sequencing
- code

## 9. Role Model

`cmon:think` should remain multi-lens by default.

Why:

- this stage is still about problem framing, opportunity selection, and early scope
- these are exactly the areas where `product`, `engineering`, and `operations` disagreement is useful

Recommended role pattern:

- `product` pushes on value and scope
- `engineering` pushes on shape, leverage, and complexity realism
- `operations` pushes on rollout, failure modes, and real-world friction

This is different from `cmon:design`, which stays owner-led.

## 10. Interaction Rules

Keep:

- one question at a time
- alternatives with recommendation
- right-sized ceremony
- no implementation before approved output

Add:

- explicit mode declaration in the skill output when useful
  - `Mode: ideate`
  - `Mode: brainstorm`
  - `Mode: fast-path`

This makes behavior legible without requiring the operator to choose the mode upfront.

## 11. What Not To Build

Do not add:

- local HTML brainstorm companion
- browser-based interactive design surface
- visual mockup runner inside `cmon:think`
- runtime-heavy orchestration for the thinking stage

If a future `cmon` needs visual support, it should be a separate optional capability, not part of the core pre-implementation thinking skill.

## 12. Migration Plan

### Phase 1: Skill contract change

- introduce `cmon:think`
- mark `cmon:brainstorm` as deprecated alias behavior in docs
- update routing docs and lifecycle references

### Phase 2: Internal mode design

- define `ideate`, `brainstorm`, and `fast-path` routing inside the skill doc
- define artifact rules per mode

### Phase 3: Prompt and template updates

- update the current brainstorm prompts and templates to reference `cmon:think`
- add lightweight ideation artifact support only if needed

### Phase 4: Example refresh

- refresh the end-to-end example and operator routing matrix to use `cmon:think`

## 13. Recommended Immediate Changes

The next implementation pass should do these three things:

1. Rename the canonical skill from `cmon:brainstorm` to `cmon:think`.
2. Rewrite the skill contract around internal modes: `ideate`, `brainstorm`, `fast-path`.
3. Keep visual/browser brainstorming explicitly out of scope for now.

## 14. Decision

Recommended decision:

- adopt `cmon:think`
- unify `ideate` and `brainstorm` under one skill
- keep the internal mode distinction
- keep `cmon:think` multi-lens
- keep `cmon:design` owner-led
- reject heavy local HTML/browser brainstorming for v0
