# cmon Debug Execution v0

Date: 2026-04-08
Status: Draft

This document turns `cmon:debug` into a manual-first debugging workflow.

It is intentionally narrow.

The goal is not to build a bug platform.

The goal is to make root-cause-first debugging repeatable before any fix attempt or workflow reroute.

## 1. Purpose

`cmon:debug` exists to answer one question cleanly:

- what is actually wrong, and what is the smallest justified next move

It should not blur investigation and implementation together.

## 2. Execution Stages

### Stage 1: Lock the Debugging Scope

Use:

- the current failing behavior
- the active command or repro path
- the relevant plan, work report, or verification evidence when they exist
- `templates/debug/debug-run-manifest-template.md`

Decide:

- what symptom is being investigated
- what area of the code or system is in current scope
- what evidence already exists
- what kind of next action would count as success for this pass

### Stage 2: Confirm Reproduction Status

Determine one of:

- reproducible now
- partially reproducible
- not reproducible yet

If the symptom cannot be reproduced, the pass is still useful only if it tightens:

- missing conditions
- environment differences
- triggering data
- required external state

Do not pretend the problem is understood when the reproduction path is still vague.

### Stage 3: Gather Immediate Evidence

Gather the smallest direct evidence that constrains the failure:

- failing command output
- stack traces
- exact logs
- visible UI state
- relevant state or data boundary
- recent changes in the affected area

This stage should narrow the boundary.

It should not yet propose a fix.

### Stage 4: Trace the Failure Boundary

Trace backward from the symptom:

- where the bad value, bad state, or wrong branch becomes visible
- what boundary feeds it
- what component or function likely introduced it

If the system has multiple layers, identify the first boundary where the observed behavior becomes wrong.

Do not skip to "the likely fix" while the boundary is still fuzzy.

### Stage 5: Form One Hypothesis

State exactly one hypothesis in the form:

`I believe the root cause is [specific cause] in [file, function, condition, or boundary] because [evidence].`

If the statement is not that specific, the pass is still in investigation mode, not hypothesis mode.

### Stage 6: Run One Targeted Check

Add one narrow confirmation instrument:

- one assertion
- one log
- one minimal failing test
- one focused repro step
- one direct state inspection

Run it.

Then do one of:

- confirm the hypothesis
- discard the hypothesis
- narrow the failure boundary further

Never stack multiple speculative checks just to increase activity.

### Stage 7: Route to the Right Next Step

After the hypothesis is confirmed or the best current boundary is clear, decide the next action:

- narrow fix in `cmon:work`
- boundary correction in `cmon:plan`
- behavior correction in `cmon:design`
- another bounded debug pass
- blocked escalation with uncertainty made explicit

Use:

- `templates/workflow/stage-transition-decision-template.md`

## 3. v0 Policy Choice

`cmon:debug` is a habit workflow, not a specialist tool suite.

It intentionally does not require:

- issue trackers
- browser automation
- persistent forensics systems
- crash daemons
- external telemetry

Those can help some debug passes, but they are not required for the base discipline.

## 4. Why This Matches cmon

This fits `cmon` because it preserves the same bias seen elsewhere in the repo:

- evidence before claims
- narrow scope before action
- explicit handoff instead of silent drift

It also extends `cmon` in one of the clearest shared directions seen across the reference skill repos.

## 5. Next Step

This execution doc now has:

- a matching manual operating procedure
- a run manifest template
- a debugging report template

Files:

- `docs/architecture/2026-04-08-debug-operating-procedure-v0.md`
- `templates/debug/debug-run-manifest-template.md`
- `templates/debug/debug-report-template.md`
