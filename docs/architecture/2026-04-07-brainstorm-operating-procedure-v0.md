# cmon Brainstorm Operating Procedure v0

Date: 2026-04-07
Status: Draft

This procedure describes how to run one `cmon:brainstorm` pass end to end.

It is intentionally manual-first.

## 1. Inputs

Before starting, collect:

- task summary
- understand packet or equivalent context
- any prior artifacts that should shape the brainstorm

Then create:

- `templates/brainstorm/brainstorm-run-manifest-template.md`

## 2. Step 1: Lock The Brainstorm Goal

Record:

- what decision this brainstorm must produce
- which questions must be resolved before planning
- whether any candidate directions already exist
- where the resulting artifact should be written

If the goal is too vague to tell whether planning can begin afterward, stop and sharpen the brainstorm objective.

## 3. Step 2: Build Shared Brainstorm Context

Use the understand packet and prior artifacts to fill:

- `templates/brainstorm/brainstorm-context-template.md`

This bundle should make the tensions visible before the lens brainstormers start.

## 4. Step 3: Run The Three Brainstormers

Dispatch:

- product brainstormer
- engineer brainstormer
- ops brainstormer

Wrap each with:

- `templates/brainstorm/lens-invocation-template.md`

Each brainstormer should propose or judge directions from its own lens only.

## 5. Step 4: Synthesize The Direction

Assemble the outputs using:

- `templates/brainstorm/synthesizer-input-template.md`

Then run:

- `agents/brainstorm/brainstorm-synthesizer.md`

The result should identify:

- recommended direction
- why alternatives were rejected or kept
- requirements and constraints
- scope boundaries
- blockers that still prevent planning

## 6. Step 5: Write The Requirements Artifact

If planning readiness is `ready`, write or update the requirements artifact using:

- `templates/brainstorm/requirements-template.md`

Default target:

- `docs/brainstorms/`

Use `docs/architecture/` only when the brainstorm is fundamentally architectural.

## 7. Step 6: Route To The Next Skill

If `Resolve Before Planning` is empty:

- move to `cmon:plan`

If blockers remain:

- stay in `cmon:brainstorm`

## 8. Failure Cases

Stop and surface the issue when:

- the three lenses reveal incompatible problem framings
- the recommended direction still depends on unresolved user-facing ambiguity
- requirements are too vague to constrain planning

`cmon:brainstorm` should fail by exposing ambiguity, not by hiding it.
