# cmon Stage Transition Contract v0

Date: 2026-04-07
Status: Draft

This document defines one shared decision contract for major `cmon` stage handoffs.

The goal is simple:

- every stage should not only produce its local artifact
- it should also state whether the next stage may responsibly begin

This absorbs a useful strength from the reference systems without adding a runtime layer.

## 1. Why This Exists

`cmon` already has many local quality gates.

Without a shared transition contract, those gates stay fragmented:

- one stage says "ready"
- another says "revise"
- another implies readiness without making the decision explicit

The transition contract makes handoff decisions consistent across:

- `cmon:understand`
- `cmon:think`
- `cmon:design`
- `cmon:plan`
- `cmon:challenge`
- `cmon:work`
- `cmon:verify`
- `cmon:compound`

## 2. Decision Shape

Every meaningful handoff should end in one of three decisions:

- `proceed`
- `revise`
- `block`

### `proceed`

The current stage produced enough clarity, quality, and evidence for the target next stage to begin responsibly.

### `revise`

The current stage is directionally correct, but its own artifact or output still needs improvement before handoff.

The default assumption is:

- revise locally first

But `revise` does **not** mean the work must stay in the same stage forever.

If attempted revision reveals that the real defect lives upstream, the workflow should explicitly reroute upstream instead of forcing the current stage to absorb the wrong job.

### `block`

The next step should not start yet, but the problem cannot be solved by simply revising the current artifact in place.

The handoff must either:

- return upstream
- escalate a missing decision
- stop until required context appears

`block` means:

- do not continue forward from the current stage

It does **not** automatically mean:

- abandon the overall task

In most cases, `block` means the workflow must reroute to the correct earlier stage or wait for missing context.

## 3. Required Fields

Use:

- `templates/workflow/stage-transition-decision-template.md`

The minimum transition decision should record:

- `From Stage`
- `To Stage`
- `Decision`
- `Reason`
- `What Is Ready`
- `What Is Missing Or Must Change`
- `Artifacts Relied On`

## 4. Stage-Specific Interpretation

### `cmon:understand`

- `proceed`
  - the context packet is strong enough for the next stage
- `revise`
  - the packet exists, but important context is still missing
- `block`
  - the task or repo area is still too ambiguous to route safely

### `cmon:think`

- `proceed`
  - a chosen direction or approved requirements are strong enough for `design` or `plan`
- `revise`
  - the direction is promising but thinking output still needs clarification
- `block`
  - blocking ambiguity remains and cannot responsibly be hand-waved into planning

### `cmon:design`

- `proceed`
  - planning may begin
- `revise`
  - the design is close but still weak or incomplete
- `block`
  - upstream requirements or task framing are too unstable for design to close alone

### `cmon:plan`

- `proceed`
  - explicit pre-work critique may begin
- `revise`
  - the plan needs stronger boundaries, traceability, or verification
- `block`
  - unresolved upstream ambiguity prevents safe planning

### `cmon:challenge`

- `proceed`
  - the tested artifact is ready for the named next stage
- `revise`
  - the design / plan package needs tightening before handoff
  - route to `cmon:design` when the weakness is behavioral, flow, state, or boundary truth
  - route to `cmon:plan` when the weakness is implementation structure, dependency, scope, or verification realism
- `block`
  - the artifact is too weak, incomplete, or misrouted for safe progression
  - do not start `cmon:work`
  - reroute upstream rather than pretending the issue can be repaired during implementation

### `cmon:work`

- `proceed`
  - the unit is implemented and ready for explicit verification
- `revise`
  - the unit stays in `cmon:work` for more implementation or tighter verification
- `block`
  - the unit cannot continue safely without upstream replanning or explicit scope decision

### `cmon:verify`

- `proceed`
  - the implementation claim is sufficiently supported and the implementation is acceptable
- `revise`
  - the change requires more work or stronger evidence before acceptance
  - default route is back to `cmon:work`
  - if implementation repair reveals that the accepted design or plan is itself wrong, the workflow should then reroute further upstream to `cmon:plan` or `cmon:design`
- `block`
  - the claim cannot be judged responsibly because the evidence base or handoff package is too weak
  - do not treat the unit as accepted
  - restore a valid upstream route before any new acceptance claim

### `cmon:compound`

- `proceed`
  - the loop is complete and the durable knowledge state is updated
- `revise`
  - the learning artifact should be improved before the loop closes
- `block`
  - compounding cannot be completed yet because the source learning is still unresolved

## 5. Reflow Rule

When a stage finds unacceptable problems, the workflow should return to the **earliest stage that truly owns the defect**.

Use this rule:

- if the defect is in framing or missing intent, reroute to `cmon:think`
- if the defect is in behavior, flow, state, or boundary truth, reroute to `cmon:design`
- if the defect is in implementation structure, unit boundaries, sequencing, or verification strategy, reroute to `cmon:plan`
- if the defect is in code, tests, or execution evidence, reroute to `cmon:work`

Operationally:

- `cmon:challenge` usually reflows to `cmon:design` or `cmon:plan`
- `cmon:verify` usually reflows to `cmon:work` first
- a later reroute from `cmon:work` to `cmon:plan` or `cmon:design` is expected when the mismatch proves structural rather than local

## 6. Routing Rule

The transition decision should name the target explicitly.

Examples:

- `cmon:understand -> cmon:think`
- `cmon:think -> cmon:design`
- `cmon:design -> cmon:plan`
- `cmon:plan -> cmon:challenge`
- `cmon:challenge -> cmon:work`
- `cmon:work -> cmon:verify`
- `cmon:verify -> cmon:compound`
- `cmon:verify -> complete`
- `cmon:compound -> complete`

## 7. Policy Choice

This is intentionally a documentation and prompt-level contract first.

It is not:

- a runtime coordinator
- a state machine daemon
- a ticketing workflow

The purpose is to make stage boundaries explicit now so later orchestration can remain thin.

## 8. Related

- `docs/architecture/2026-04-07-next-opportunities-and-decisions-v0.md`
- `docs/architecture/2026-04-07-core-skills-v0.md`
