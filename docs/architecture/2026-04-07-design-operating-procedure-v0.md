# cmon Design Operating Procedure v0

Date: 2026-04-07
Status: Draft

This procedure describes how to run `cmon:design` in its owner-led form.

It is intentionally manual-first.

## 1. Inputs

Before starting, collect:

- approved requirements artifact
- understand packet or equivalent context when relevant
- any prior design or architecture artifacts that should constrain this pass

Then create:

- `templates/design/design-run-manifest-template.md`

## 2. Step 1: Lock The Owner Mode

Record:

- whether this design pass is `product-led` or `engineering-led`
- what ambiguity the design must remove
- which challenge lenses will run
- where the resulting artifact should be written

If owner mode is unclear, decide based on what would most distort planning if left vague:

- choose `product-led` for user or operator behavior ambiguity
- choose `engineering-led` for interface or system-boundary ambiguity

## 3. Step 2: Draft The Design Artifact

Write the draft using:

- `templates/design/design-spec-template.md`

Optional owner-assist prompts:

- `agents/design/product-designer.md`
- `agents/design/engineering-designer.md`

The draft should be explicit enough that challenge lenses can criticize real decisions rather than react to placeholders.

## 4. Step 3: Run Non-Owner Challenge

Run the relevant non-owner challenge prompts:

- `agents/design/product-challenger.md`
- `agents/design/engineering-challenger.md`
- `agents/design/ops-challenger.md`

Wrap each with:

- `templates/design/challenge-invocation-template.md`

Run all non-owner lenses by default.
Skip a lens only when it is genuinely irrelevant to the design topic.

## 5. Step 4: Synthesize The Challenge Result

Assemble the outputs using:

- `templates/design/design-synthesizer-input-template.md`

Then run:

- `agents/design/design-synthesizer.md`

The result should identify:

- whether planning may begin
- what must be fixed before planning
- what can be deferred safely
- whether any quality-gate dimension is still weak

## 6. Step 5: Revise Or Approve

If the decision is `revise`:

- update the design artifact
- re-run the relevant challenge lenses
- re-run the synthesizer

If the decision is `ready`:

- treat the design as approved
- hand it to `cmon:plan`

## 7. Step 6: Route To The Next Skill

Record the result using:

- `templates/workflow/stage-transition-decision-template.md`

Typical outcomes:

- `proceed -> cmon:plan`
- `revise -> cmon:design`
- `block`

## 8. Failure Cases

Stop and surface the issue when:

- the owner draft still contains obvious placeholders
- challenge outputs reveal incompatible framings of the problem
- the design keeps pushing implementation-shaping ambiguity downstream

`cmon:design` should fail by exposing weak decisions, not by pretending planning will sort them out.
