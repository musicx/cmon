# cmon Debug Operating Procedure v0

Date: 2026-04-08
Status: Draft

This procedure describes how to run one debugging pass using `cmon:debug`.

It is intentionally manual-first.

## 1. Inputs

Before starting, collect:

- the current symptom
- the current failing command, test, or repro path
- any relevant work report, verification evidence, or review note
- the likely file or boundary area

Then create:

- `templates/debug/debug-run-manifest-template.md`

## 2. Step 1: Lock the Investigation Scope

Record:

- symptom
- reproduction mode
- in-scope area
- known evidence
- stop condition for this debugging pass

Do not start with a vague "something is broken" frame.

If the symptom itself is still unclear, first tighten the symptom statement.

## 3. Step 2: Confirm Reproduction

Before reasoning about fixes, decide whether the issue is:

- reproducible now
- partially reproducible
- not yet reproducible

If reproducibility is weak, record what seems to be missing:

- input conditions
- environment differences
- role or data conditions
- timing conditions

Do not disguise missing reproduction as understanding.

## 4. Step 3: Gather Immediate Evidence

Capture the smallest direct evidence available:

- the exact failing command output
- the exact log line or stack trace
- the exact UI state or data mismatch
- the exact boundary where behavior first looks wrong

Also inspect recent changes in the relevant area when they are likely to matter.

This step narrows the search space.

It is not a license to start editing code.

## 5. Step 4: Trace Backward

Read the relevant code path and trace backward from the failure:

- where the bad state enters
- where the wrong branch is chosen
- where a missing assumption first becomes visible

If the system is multi-stage, identify the first stage where behavior becomes wrong.

## 6. Step 5: Write One Hypothesis

State one concrete hypothesis:

- specific cause
- specific file, function, condition, or boundary
- specific evidence

If the statement is still broad or hand-wavy, do more tracing before continuing.

## 7. Step 6: Run One Targeted Check

Add one narrow check:

- one assertion
- one log
- one minimal failing test
- one focused repro step
- one direct state inspection

Run it and decide:

- confirmed
- discarded
- boundary narrowed but still not confirmed

Do not pile on multiple checks just because the first did not immediately solve the problem.

## 8. Step 7: Write the Debug Report

After the pass, write:

- `templates/debug/debug-report-template.md`

The report should capture:

- symptom
- reproduction status
- evidence
- current hypothesis
- confirmed root cause or best current boundary
- recommended next action

## 9. Step 8: Route to the Right Next Skill

Record the result using:

- `templates/workflow/stage-transition-decision-template.md`

Default transitions:

- `proceed -> cmon:work`
  - when the cause is clear and a narrow fix is justified

- `revise -> cmon:debug`
  - when one hypothesis was invalidated but the problem remains bounded and investigable

- `block -> cmon:plan`
  - when the real issue is a broken or missing implementation boundary

- `block -> cmon:design`
  - when the real issue is behavior or state ambiguity

## 10. Failure Cases

Stop and surface the issue when:

- the symptom cannot yet be stated precisely
- reproduction conditions are still too weak to support a meaningful hypothesis
- the investigation boundary keeps expanding beyond a narrow pass
- evidence contradicts the current hypothesis and no tighter next hypothesis is yet justified
- repeated hypotheses fail and the problem is no longer being narrowed

`cmon:debug` should stop with explicit uncertainty rather than pretend progress through patch accumulation.
