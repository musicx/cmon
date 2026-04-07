# cmon Think Operating Procedure v0

Date: 2026-04-07
Status: Draft

This procedure describes how to run `cmon:think` in v0.

It is intentionally manual-first.

## 1. Inputs

Before starting, collect:

- task summary
- understand packet or equivalent context
- any prior artifacts that should shape the thinking pass

Then create:

- `templates/think/think-run-manifest-template.md`

## 2. Step 1: Lock The Mode And Goal

Record:

- which mode applies:
  - `ideate`
  - `brainstorm`
  - `fast-path`
- what decision or output this pass must produce
- which questions must be resolved before design or planning
- whether any candidate directions already exist
- where the resulting artifact should be written

If the goal is too vague to tell whether the next legal step is `cmon:think`, `cmon:design`, or `cmon:plan`, stop and sharpen the objective.

## 3. Step 2: Build Shared Think Context

Use the understand packet and prior artifacts to fill:

- `templates/think/think-context-template.md`

This bundle should make the tensions visible before the lens thinkers start.

## 4. Step 3: Run The Three Thinkers

Dispatch:

- product thinker
- engineer thinker
- ops thinker

Wrap each with:

- `templates/think/lens-invocation-template.md`

Each thinker should propose or judge directions from its own lens only.

## 5. Step 4: Synthesize The Result

Assemble the outputs using:

- `templates/think/synthesizer-input-template.md`

Then run:

- `agents/think/think-synthesizer.md`

The result should identify:

- mode outcome
- recommended direction
- why alternatives were rejected or kept
- requirements and constraints when they exist
- scope boundaries
- blockers that still prevent design or planning

## 6. Step 5: Write The Durable Artifact

If the result is a ranked-direction set that should survive beyond the session, write it using:

- `templates/think/directions-template.md`

If the result includes approved requirements, write or update the requirements artifact using:

- `templates/think/requirements-template.md`

Default target:

- `docs/brainstorms/`

Use `docs/architecture/` only when the thinking topic is fundamentally architectural.

## 7. Step 6: Route To The Next Skill

If the output is still a ranked direction set or unresolved blockers remain:

- stay in `cmon:think`

If requirements are approved but design ambiguity remains:

- move to `cmon:design`

If requirements are approved and design ambiguity is already low:

- move to `cmon:plan`

## 8. Failure Cases

Stop and surface the issue when:

- the three lenses reveal incompatible problem framings
- the recommended direction still depends on unresolved user-facing ambiguity
- the output is too vague to constrain the next skill cleanly

`cmon:think` should fail by exposing ambiguity, not by hiding it.
