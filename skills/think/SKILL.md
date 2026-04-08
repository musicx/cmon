---
name: cmon:think
description: Use before design or planning when the user needs idea generation, direction finding, scope shaping, approach comparison, or requirements clarification for a non-trivial change.
---

# cmon:think

Think through what should happen before design or planning starts.

`cmon:think` replaces `cmon:brainstorm` as the canonical pre-design thinking skill.

It keeps the useful distinction seen in other harness systems between:

- idea generation
- requirements clarification

But it exposes them through one skill rather than two separate top-level commands.

## Hard Gate

Do not move to implementation from this skill.

Do not use this skill to write the implementation plan.

The only normal next steps are:

- remain in `cmon:think` while narrowing a direction
- move to `cmon:design`
- move to `cmon:plan` only when both behavior and design ambiguity are already low enough

## Internal Modes

`cmon:think` routes internally into one of three modes.

### Mode A: `ideate`

Use when the user mainly needs candidate directions.

Typical triggers:

- what should we build
- what should I improve
- give me ideas
- surprise me
- is this worth building
- what would you change

Outputs:

- ranked or recommended directions
- reasons a direction is worth deeper exploration

### Mode B: `brainstorm`

Use when the user already has a direction, but needs it clarified.

Typical triggers:

- let's brainstorm
- help me think through X
- refine this idea
- which approach should we take
- define the requirements

Outputs:

- approved requirements
- alternatives and recommendation
- scope boundaries, success criteria, and blockers

### Mode C: `fast-path`

Use when the request is already clear enough that full thinking ceremony is unnecessary.

Outputs:

- compact durable handoff note when useful
- direct route to `cmon:design` or `cmon:plan`

## Required Lenses

Every meaningful `cmon:think` pass should explicitly examine:

- `Product`
  - Is this the right problem or direction?
  - Is scope too wide or too narrow?

- `Engineering`
  - Is the shape understandable and implementable?
  - Where are the leverage and complexity risks?

- `Operations`
  - What assumptions fail in rollout, configuration, migration, retries, or partial failure?

## Core Contract

`cmon:think` answers:

- what directions are worth attention
- what selected direction should mean
- why it matters
- what is in and out of scope
- whether enough clarity exists to move into design or planning

It does not answer:

- detailed technical design
- exact file structure
- implementation sequencing
- code

## Workflow

### Stage 0: Assess and route

Decide which internal mode fits:

- `ideate`
- `brainstorm`
- `fast-path`

If operator control is needed, start from:

- `templates/think/think-run-manifest-template.md`

### Stage 1: Recover context

Run `cmon:understand` or recover equivalent context.

Ground the thinking in the actual repo before going deep.

When an `understand` packet already exists, treat it as the default shared starting point instead of silently rebuilding incompatible context.

### Stage 2: Run the selected mode

#### `ideate`

- generate multiple grounded directions
- critique and reduce the set
- recommend the strongest few
- if one direction is chosen, stay in `cmon:think` and switch to `brainstorm`

#### `brainstorm`

- clarify the chosen direction
- compare meaningful approaches
- resolve product and scope decisions
- write approved requirements

#### `fast-path`

- validate that clarity is already sufficient
- write only the minimum durable handoff artifact if useful

### Stage 3: Write the durable artifact when needed

Write the result to:

- `docs/brainstorms/` for requirements and chosen-direction artifacts

Use:

- `templates/think/directions-template.md` when `ideate` needs a durable ranked-direction artifact
- `templates/think/requirements-template.md` when `brainstorm` produces approved requirements

### Stage 4: Get approval before handoff

## Hard Rules

- No coding
- No exact file layout, implementation sequencing, or shell choreography
- No silent collapse of product questions into engineering assumptions
- No skipping the operations viewpoint on meaningful work
- No default inclusion of libraries, schemas, endpoints, or code structure unless the thinking topic is itself about an architectural decision
- No move to `cmon:plan` while blocking ambiguity remains

## Handoff

If the result is still a ranked direction set:

- stay in `cmon:think` and continue on the chosen direction

If approved requirements exist:

- move to `cmon:design` when flow, state, interfaces, or cross-surface behavior still need explicit design work
- otherwise move to `cmon:plan`

If not approved:

- revise and continue within `cmon:think`
