# cmon Auxiliary Skill Invocation Policy v0

Date: 2026-04-07
Status: Draft

This document defines when auxiliary `cmon:*` skills should be invoked.

The goal is to keep the system disciplined without turning every pass into mandatory ceremony.

Current auxiliary skills:

- `cmon:worktree`
- `cmon:pressure-test`
- `cmon:refresh-knowledge`
- `cmon:revalidate`

## 1. `cmon:worktree`

### Recommended

Use `cmon:worktree` when:

- the current branch contains unrelated changes
- the next unit is risky enough that a cleaner diff boundary is worth explicit isolation
- more than one stream of implementation or fix work may proceed in parallel
- a review or debug pass would be materially clearer in an isolated workspace

### Conditionally Mandatory

Treat `cmon:worktree` as effectively mandatory when:

- the same working tree already carries unrelated in-progress work
- the intended parallel work would otherwise violate clean write-scope isolation
- the invoking workflow explicitly depends on a clean diff boundary

### Usually Skip

Usually skip it when:

- the change is already isolated enough on the current branch
- the overhead of another workspace is clearly higher than the isolation value
- the task is tiny and does not benefit from a second filesystem workspace

## 2. `cmon:pressure-test`

### Recommended

Use `cmon:pressure-test` when:

- a `design` artifact exists and the next decision is whether planning may begin
- a `plan` exists and the work is non-trivial enough that critique should be reused explicitly
- a `work` handoff package exists and you want one explicit readiness pass before broader review
- a `review` packet exists but acceptance confidence depends on packet completeness

### Conditionally Mandatory

Treat `cmon:pressure-test` as effectively mandatory when:

- the artifact is non-trivial and cross-cutting
- the next stage is expensive to start wrong
- prior critique surfaces already exist but would otherwise be skipped ad hoc

### Usually Skip

Usually skip it when:

- the artifact is tiny and the underlying stage already includes the necessary critique inline
- the pressure-test would duplicate a critique pass already run moments ago with no new evidence

## 3. `cmon:compound` vs `cmon:revalidate` vs `cmon:refresh-knowledge`

### Use `cmon:compound`

When the main question is:

- what new reusable lesson did this accepted work create

Typical outputs:

- new bug learning
- new pattern doc
- update to one clearly related existing doc

### Use `cmon:revalidate`

When the main question is:

- which existing artifacts in this area are still trustworthy, and which now need lifecycle action

Typical triggers:

- a periodic audit is due
- artifact trust is in doubt across more than one candidate doc
- proof examples, routing docs, or operator references may no longer match current contracts

Typical outputs:

- keep
- refresh
- supersede
- archive
- ignore_for_now

### Escalate To `cmon:refresh-knowledge`

Escalate when the main question becomes:

- is the existing knowledge area itself drifting, overlapping, or contradictory

Typical triggers:

- multiple stale candidates are discovered
- overlap or duplication goes beyond one simple in-place update
- a pattern doc looks broader than current evidence supports
- a compound pass reveals that maintenance should target a topic area, not just one new learning
- a `revalidate` pass already identified one narrow maintenance target

### Usually Do Not Bind GC To `cmon:compound`

In early `cmon`, do not force garbage collection as a default sub-step of `cmon:compound`.

Prefer:

- explicit periodic `cmon:revalidate`
- or a direct recommendation from `cmon:compound` when it notices likely drift

## 4. `cmon:refresh-knowledge`

### Recommended

Use it when:

- stale, overlapping, duplicated, or too-broad docs are already suspected
- a recent `compound` pass points to a narrow maintenance follow-up

### Conditionally Mandatory

Treat it as effectively mandatory when:

- accepted newer evidence clearly contradicts older guidance
- duplicate docs are likely to cause future drift if left alone

### Usually Skip

Usually skip it when:

- one simple `compound` update is enough
- the evidence for drift is still weak
- the scope would be broad enough that the pass is really a docs rewrite project

## 5. `cmon:revalidate`

### Recommended

Use it when:

- a periodic artifact trust audit is due
- one topic area contains several suspect artifacts
- proof examples or operator-facing references may have drifted from current contracts

### Conditionally Mandatory

Treat it as effectively mandatory when:

- artifact trust is materially in doubt, but the right maintenance action is still unclear
- direct refresh would otherwise start without a clear audit scope or source of truth

### Usually Skip

Usually skip it when:

- one simple direct update is obviously enough
- `cmon:compound` already knows it only needs one narrow in-place update
- the task is really fresh knowledge capture, not artifact revalidation

## 6. Policy Choice

Auxiliary skills should be:

- explicit
- narrow
- justified by current artifact maturity

They should not become:

- mandatory boilerplate on every small task
- a shadow lifecycle parallel to the real core chain
