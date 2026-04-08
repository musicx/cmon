# cmon Compound Operating Procedure v0

Date: 2026-04-07
Status: Draft

This procedure describes how to run one `cmon:compound` pass end to end.

It is intentionally manual-first.

## 1. Inputs

Before starting, collect:

- completed work summary
- relevant review result
- relevant verification evidence
- any existing solution docs that may overlap

Then create:

- `templates/compound/compound-run-manifest-template.md`

## 2. Step 1: Run The Trigger Checklist

Use:

- `templates/compound/trigger-checklist-template.md`

If the outcome is `skip`, stop unless the user explicitly wants the documentation anyway.

If the outcome is `mandatory` or `recommended`, continue.

## 3. Step 2: Build Shared Compound Context

Fill:

- `templates/compound/compound-context-template.md`

Include the strongest evidence for why this lesson may need to survive the session.

## 4. Step 3: Run The Three Curators

Dispatch:

- product curator
- engineer curator
- ops curator

Wrap each with:

- `templates/compound/lens-invocation-template.md`

Each curator should decide what future work must remember from its own lens.

## 5. Step 4: Synthesize The Compound Decision

Assemble the outputs using:

- `templates/compound/synthesizer-input-template.md`

Then run:

- `agents/compound/compound-synthesizer.md`

The result should decide:

- mandatory, recommended, or skip
- new bug doc, new pattern doc, update existing, or none
- what the reusable lesson actually is

## 6. Step 5: Write Or Update The Durable Artifact

If the decision is:

- `new_bug`, use `templates/solutions/bug-solution-template.md`
- `new_pattern`, use `templates/solutions/pattern-solution-template.md`
- `update_existing`, revise the existing doc rather than creating a duplicate

Default target:

- `docs/solutions/`

## 7. Step 6: Close The Loop

Record the result using:

- `templates/workflow/stage-transition-decision-template.md`

After compounding:

- `proceed -> complete`
- future `understand`, `brainstorm`, `plan`, and `review` passes should be able to discover the new knowledge

If the maintenance result is real but incomplete:

- `revise -> cmon:compound`

If the source learning is too weak or contradictory to close responsibly:

- `block`

## 8. Failure Cases

Stop and surface the issue when:

- trigger evidence is too weak to justify a doc
- the lesson is too vague to be reusable
- an existing doc is clearly related but update-versus-new remains ambiguous

`cmon:compound` should fail by avoiding noisy docs, not by forcing weak documentation.
