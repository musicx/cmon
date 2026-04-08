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
- `cmon:pressure-test`
- `cmon:work`
- `cmon:verify`
- `cmon:review`
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

The work stays in the same stage.

### `block`

The next step should not start yet, but the problem cannot be solved by simply revising the current artifact in place.

The handoff must either:

- return upstream
- escalate a missing decision
- stop until required context appears

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

### `cmon:pressure-test`

- `proceed`
  - the tested artifact is ready for the named next stage
- `revise`
  - the current stage artifact needs tightening before handoff
- `block`
  - the artifact is too weak, incomplete, or misrouted for safe progression

### `cmon:work`

- `proceed`
  - the unit is implemented and ready for explicit verification
- `revise`
  - the unit stays in `cmon:work` for more implementation or tighter verification
- `block`
  - the unit cannot continue safely without upstream replanning or explicit scope decision

### `cmon:verify`

- `proceed`
  - the implementation claim is sufficiently supported and may either stop, compound, or escalate to broader review
- `revise`
  - the change requires more work or stronger evidence before acceptance
- `block`
  - the claim cannot be judged responsibly because the evidence base or handoff package is too weak

### `cmon:review`

- `proceed`
  - the change is accepted and may move to `cmon:compound` or stop as complete
- `revise`
  - the change requires fixes and should return to `cmon:work`
- `block`
  - acceptance is impossible because the target or evidence base is insufficient for review

### `cmon:compound`

- `proceed`
  - the loop is complete and the durable knowledge state is updated
- `revise`
  - the learning artifact should be improved before the loop closes
- `block`
  - compounding cannot be completed yet because the source learning is still unresolved

## 5. Routing Rule

The transition decision should name the target explicitly.

Examples:

- `cmon:understand -> cmon:think`
- `cmon:think -> cmon:design`
- `cmon:design -> cmon:plan`
- `cmon:plan -> cmon:pressure-test`
- `cmon:pressure-test -> cmon:work`
- `cmon:work -> cmon:verify`
- `cmon:verify -> cmon:compound`
- `cmon:verify -> cmon:review`
- `cmon:review -> cmon:compound`
- `cmon:verify -> complete`
- `cmon:review -> complete`
- `cmon:compound -> complete`

## 6. Policy Choice

This is intentionally a documentation and prompt-level contract first.

It is not:

- a runtime coordinator
- a state machine daemon
- a ticketing workflow

The purpose is to make stage boundaries explicit now so later orchestration can remain thin.

## 7. Related

- `docs/architecture/2026-04-07-next-opportunities-and-decisions-v0.md`
- `docs/architecture/2026-04-07-core-skills-v0.md`
