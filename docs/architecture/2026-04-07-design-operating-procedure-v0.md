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

The draft should be explicit enough that `cmon:challenge(mode=design)` can criticize real decisions rather than react to placeholders.

Include human-review aids when they clarify the design:

- summary of what is being built and why
- interaction model tables
- Mermaid flowcharts, state diagrams, sequence diagrams, or graphs
- explicit failure and degraded-state behavior

## 4. Step 3: Self-Check Challenge Readiness

Before leaving `cmon:design`, confirm:

- behavior is explicit enough for human review
- planning would not need to invent flow, state, boundary, or interaction truth
- known blockers are recorded instead of hidden
- the normal next stage is `cmon:challenge(mode=design)`

If these checks fail, revise the design artifact inside `cmon:design`.

## 5. Step 4: Route To The Next Skill

Record the result using:

- `templates/workflow/stage-transition-decision-template.md`

Typical outcomes:

- `proceed -> cmon:challenge(mode=design)`
- `revise -> cmon:design`
- `block`

After `cmon:challenge(mode=design)` returns `proceed`, pause for `human_design_approval` before `cmon:plan`.

## 6. Failure Cases

Stop and surface the issue when:

- the owner draft still contains obvious placeholders
- the design keeps pushing implementation-shaping ambiguity downstream
- the design is not reviewable by a human without reconstructing key flows from chat

`cmon:design` should fail by exposing weak decisions, not by pretending planning will sort them out.
