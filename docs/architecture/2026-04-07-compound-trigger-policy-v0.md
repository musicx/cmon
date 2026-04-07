# cmon Compound Trigger Policy v0

Date: 2026-04-07
Status: Draft

This document defines when `cmon:compound` is mandatory, when it is merely recommended, and when it should be skipped.

## 1. Purpose

`cmon` should not document every trivial change.

But it also should not let reusable lessons disappear into chat history.

So `cmon:compound` needs a trigger policy, not a vibe.

## 2. Trigger Outcomes

`cmon:compound` uses three outcomes:

- `mandatory`
- `recommended`
- `skip`

## 3. Mandatory Triggers

Compounding is mandatory when any one of these is true:

1. **Non-trivial root cause discovered**
   - A bug or failure required real investigation to understand what was actually wrong.

2. **Reusable guardrail or invariant established**
   - The work revealed a rule that future planning, execution, or review should explicitly preserve.

3. **Prior assumption or pattern was corrected**
   - A previously reasonable belief turned out to be wrong, and that correction is likely to matter again.

4. **Operational gotcha or rollout constraint surfaced**
   - The accepted work exposed a migration, config, retry, partial-failure, or rollout lesson with likely future reuse.

5. **Existing knowledge is now stale or contradicted**
   - The current work proves that an existing solution or pattern doc should be updated, replaced, or consolidated.

These are hard triggers because the cost of forgetting them is high.

## 4. Recommended Triggers

Compounding is recommended when the signal is real but weaker.

Examples:

- review exposed an acceptance heuristic worth reusing
- the work created a pattern likely to recur in the same subsystem
- future planning would be faster or clearer if this lesson were written down

If two or more recommended triggers are true, treat the result as `mandatory`.

## 5. Skip Cases

Compounding should be skipped when the work is mostly:

- a trivial typo or wording fix
- one-off local cleanup with no reusable lesson
- repetition of an already-documented rule without new evidence

Skipping is correct in these cases. `cmon` is not a diary.

## 6. Source Of Trigger Evidence

Trigger evidence may come from:

- the work report
- the review result
- verification notes
- direct comparison against existing `docs/solutions/`

Do not trigger solely from a vague intuition that "this feels useful."

## 7. Why This Matches cmon

This policy keeps `compound` aligned with your stated preference:

- mandatory when truly useful
- not universal after every change
- durable enough to create a real knowledge flywheel

## 8. Next Step

This trigger policy now has a matching execution flow and operating procedure:

- `docs/architecture/2026-04-07-compound-execution-v0.md`
- `docs/architecture/2026-04-07-compound-operating-procedure-v0.md`

The next useful layer after this policy is:

- an end-to-end example that proves the chain all the way through `cmon:compound`
