# cmon Pressure-Test Operating Procedure v0

Date: 2026-04-07
Status: Draft

This procedure describes how to run one `cmon:pressure-test` pass end to end.

## 1. Inputs

Start from:

- the stage under test
- the primary artifact path
- the expected next stage
- any already-known supporting artifacts

Then fill:

- `templates/workflow/pressure-test-run-manifest-template.md`

## 2. Step 1: Identify The Critique Surface

Map the target stage to the existing critique surface:

- `design` -> design challenge
- `plan` -> plan critique stack
- `work` -> work internal review loop
- `review` -> review packet completeness plus review synthesis

Do not invent a new critique stack when one already exists.

## 3. Step 2: Assemble Required Artifacts

Verify the primary artifact exists.

Then verify the minimum context for that stage:

- upstream intent artifacts when relevant
- work evidence when relevant
- current transition target

If key artifacts are missing in a way that undermines the critique, record a likely `block` outcome early.

## 4. Step 3: Run The Existing Critique Surface

Use the stage's existing prompts and templates rather than making up a new review shape.

## 5. Step 4: Summarize The Result

Write:

- `templates/workflow/pressure-test-summary-template.md`

Then record:

- `templates/workflow/stage-transition-decision-template.md`

The transition decision is the actual output contract.

## 6. Step 5: Route

Possible outcomes:

- `proceed`
- `revise`
- `block`

The output should name both:

- the decision
- the target stage

## 7. Failure Cases

Stop and surface the issue when:

- the target artifact does not exist
- the requested stage has no established critique surface
- the packet is too incomplete to return an honest readiness decision
