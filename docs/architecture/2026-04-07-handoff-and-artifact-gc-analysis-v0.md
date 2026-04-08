# cmon Handoff and Artifact GC Analysis v0

Date: 2026-04-07
Status: Draft

This document deepens two workflow concerns that now matter more than adding new stages:

1. stronger stage handoff design
2. continuous artifact garbage collection and maintenance

These are not a strategic pivot away from `cmon`.

They are a tightening pass on the current direction:

- explicit contracts
- durable artifacts
- bounded execution
- lightweight orchestration
- compound knowledge without a runtime-heavy platform

## 1. Why These Two Areas Matter Now

`cmon` already has:

- a stable core chain
- explicit stage ownership
- a shared `proceed / revise / block` transition contract
- compound capture and scoped knowledge refresh

What it does not yet have at the same level of maturity is:

- a richer theory of what exactly gets handed off between stages
- a broader lifecycle policy for artifacts after they are created

At this point, missing stages are no longer the main risk.

The bigger risks are:

- weak handoff packets that technically exist but still leave the next stage guessing
- stale or overlapping artifacts that make the repo harder to trust over time
- growing artifact volume without clear lifecycle rules

So these two areas are the right next focus.

## 2. Relationship To Harness Engineering

These two areas map cleanly onto the harness-engineering ideas you called out, but without forcing full alignment to anyone else's rulebook.

### Handoff Design Strengthens

- explicit context instead of implied context
- maps over giant manuals
- central boundaries with local autonomy
- human steering at stage boundaries

### Artifact GC Strengthens

- continuous cleanup over periodic cleanup
- encoded taste instead of accidental drift
- agent legibility through trustworthy artifacts

This is an optimization of `cmon`'s current identity, not a shift toward:

- runtime-heavy orchestration
- more model freedom
- less planning
- less boundary discipline

## 3. Current State

### What Already Exists For Handoffs

- shared transition decision shape via `proceed / revise / block`
- per-stage manifests
- explicit stage ownership
- explicit review and compound handoff packets
- a thin critique reuse layer through `cmon:pressure-test`

Key docs:

- `docs/architecture/2026-04-07-stage-transition-contract-v0.md`
- `docs/architecture/2026-04-07-core-skills-v0.md`
- `templates/workflow/stage-transition-decision-template.md`

### What Already Exists For Artifact Maintenance

- `cmon:compound` for new or directly updated reusable knowledge
- `cmon:refresh-knowledge` for stale, overlapping, duplicated, or too-broad knowledge docs
- trigger policies and invocation policy for when these should run

Key docs:

- `docs/architecture/2026-04-07-compound-trigger-policy-v0.md`
- `docs/architecture/2026-04-07-knowledge-maintenance-v0.md`
- `docs/architecture/2026-04-07-auxiliary-skill-invocation-policy-v0.md`

## 4. Main Gaps

## 4.1 Handoff Gaps

The current transition contract answers:

- may the next stage begin

But it does not yet fully answer:

- what exact packet the next stage is allowed to trust
- what maturity standard the artifact must meet before handoff
- what freshness guarantees apply
- what is allowed to remain unresolved versus what invalidates handoff
- how upstream corrections should be routed when the next stage finds defects

In practice, `proceed / revise / block` is necessary but still not sufficient.

`cmon` needs a stronger answer to:

- what does the producer owe the consumer
- what can the consumer assume without reopening the whole prior stage

## 4.2 Artifact GC Gaps

Current maintenance logic is strongest for `docs/solutions/`.

It is weaker for the full artifact system:

- requirements docs
- design docs
- plan docs
- manifests
- review packets
- example artifacts
- operator-facing routing docs

Today, many of these have implied lifecycle rules, but not explicit ones.

That creates several likely failure modes:

- superseded artifacts remain discoverable without clear status
- examples continue to exist after the underlying contract changes
- stale manifests create ritual overhead without reusable value
- knowledge refresh improves solution docs while other artifact families continue to drift

So the problem is bigger than "refresh docs."

The real question is:

- which artifacts are durable
- which are ephemeral
- which are reference-only
- which need explicit retirement or supersession rules

## 5. Design Direction

## 5.1 Handoff Should Move From Decision-Only To Packet-Plus-Decision

The stronger model is:

- every major stage has a handoff packet
- every packet has a readiness decision
- every readiness decision names what the next stage may rely on

In early `cmon`, a handoff packet should default to:

- existing canonical stage artifacts
- plus a normalized transition decision

It should not default to creating a brand-new peer artifact just because a handoff happened.

The handoff unit should therefore be:

- artifact(s)
- transition decision
- readiness claims
- unresolved items
- evidence of freshness

So the first design question is not:

- what new packet artifact should be added

It is:

- how to normalize reuse of current canonical artifacts so the consumer stage can trust them cleanly

This stays lightweight if the packet shape is standardized.

It does not require:

- a daemon
- a runtime coordinator
- background sync

## 5.2 Artifact GC Should Expand From Knowledge Refresh To Artifact Lifecycle Management

`cmon:refresh-knowledge` should remain narrow.

But the architecture around it should broaden into an explicit artifact lifecycle model.

In early `cmon`, GC discovery should not be forced into `cmon:compound`.

Instead, use:

- `cmon:revalidate` for periodic or explicitly requested artifact trust audits
- `cmon:refresh-knowledge` for narrow maintenance once the target is already clear

The right split is:

- capture: create or update reusable learning
- maintenance: refresh drifting knowledge
- lifecycle management: decide whether an artifact is active, durable, superseded, archived, or disposable

This does not mean creating a giant content management system.

It means defining simple rules for how each artifact family should age.

## 6. Proposed Handoff Model

## 6.1 Core Handoff Fields

Every meaningful stage handoff should eventually standardize around:

- `producer_stage`
- `consumer_stage`
- `decision`
- `primary_artifact_paths`
- `artifacts_relied_on`
- `what_is_ready`
- `allowed_open_questions`
- `blocking_unknowns`
- `freshness_statement`
- `recommended_next_action`

These fields should initially live in:

- the transition decision
- stage manifests
- or another thin wrapper around existing canonical artifacts

They do not require a second parallel artifact tree.

## 6.2 Producer Obligations

Before a stage may hand off, it should state:

- what artifact is canonical
- what supporting artifacts are required reading
- what assumptions were intentionally left unresolved
- what downstream stage should not re-decide
- what downstream stage must validate independently

This is the missing contract boundary.

## 6.3 Consumer Rights

The receiving stage should be allowed to:

- trust named canonical artifacts
- reject stale or contradictory packets
- return upstream with `revise` or `block`
- avoid reopening settled issues unless new evidence appears

This keeps the workflow from degenerating into:

- endless restatement
- hidden redesign during planning
- hidden replanning during work

## 6.4 Handoff Failure Taxonomy

It would help to explicitly distinguish:

- `weak_packet`
  - the artifact exists but is not decision-grade
- `stale_packet`
  - the artifact was once valid but is no longer trustworthy
- `contradictory_packet`
  - source artifacts disagree
- `underspecified_packet`
  - critical consumer inputs are missing
- `overweight_packet`
  - too much irrelevant material obscures the canonical source

This is useful because not every handoff failure should be treated as the same kind of revision.

## 7. Proposed Artifact GC Model

## 7.1 Artifact Families

`cmon` should explicitly classify artifacts by family:

### Decision Artifacts

- current requirements
- current design
- current implementation plan
- current work manifest

These are the canonical decision artifacts for the current chain.

### Durable Knowledge Artifacts

- solution docs
- pattern docs
- guardrail docs
- routing references intended for reuse

These should remain discoverable and trustworthy over time.

### Proof Artifacts

- end-to-end examples
- review packets
- example manifests
- example transition records

These prove workflow behavior, but are not always the canonical operational reference.

### Ephemeral Working Artifacts

- scratch manifests
- transient local notes
- one-off helper outputs with no reuse value

These should usually not accumulate indefinitely.

Artifact family and lifecycle state should stay separate.

The same artifact may remain in one family while changing lifecycle state over time.

## 7.2 Lifecycle States

For artifact families that matter long-term, `cmon` should converge on a small status model:

- `active`
- `durable`
- `superseded`
- `archived`
- `ephemeral`

Not every file needs frontmatter immediately.

But the architecture should define what these states mean.

## 7.3 GC Triggers

Artifact cleanup or maintenance should be triggered by:

- newer canonical artifact replaces an older one
- routing or policy doc no longer matches current contracts
- proof example still exists but no longer proves the intended behavior cleanly
- duplicate durable guidance increases retrieval ambiguity
- artifact volume makes discovery materially worse

Default early owner:

- `cmon:revalidate` on a periodic or explicitly requested basis

Conditional owners later, only if dogfooding proves payoff:

- `cmon:compound` may suggest a GC follow-up
- other stage skills may surface suspected drift, but should not be forced to carry GC by default

## 7.4 GC Actions

The relevant actions are:

- update
- supersede
- consolidate
- narrow
- archive
- ignore

The design should avoid broad "cleanup days."

It should bias toward narrow, evidence-backed cleanup in the normal workflow.

## 8. Proposed Implementation Plan

## Phase 1: Deepen the Handoff Contract

Goal:

- make handoff packets stronger than a bare transition decision

Deliverables:

- a new architecture doc for handoff packet design
- a standard handoff packet template
- a handoff maturity rubric
- a failure taxonomy for weak, stale, contradictory, and overweight packets

Expected repo impact:

- update stage manifests to reference the packet model
- update `cmon:pressure-test` to inspect packet strength, not just artifact existence

## Phase 2: Define Artifact Lifecycle Policy

Goal:

- make artifact aging and cleanup explicit across more than just `docs/solutions/`

Deliverables:

- an artifact lifecycle architecture doc
- an artifact family matrix
- a status model for durable, superseded, archived, and ephemeral artifacts
- a GC trigger and action matrix
- a `cmon:revalidate` contract for periodic audit and routing

Expected repo impact:

- clarify which docs are canonical versus proof-only
- clarify what should remain discoverable versus what should be archived or ignored

## Phase 3: Tighten Knowledge Maintenance

Goal:

- connect `compound`, `revalidate`, `refresh-knowledge`, and broader artifact lifecycle rules

Deliverables:

- revised `cmon:compound`, `cmon:revalidate`, and `cmon:refresh-knowledge` relationship doc
- narrower routing rules for when a simple update is enough versus when topic maintenance is required
- maintenance heuristics for proof docs and operator-facing references

Expected repo impact:

- reduce duplicate "update existing" behavior across adjacent artifact families

## Phase 4: Proof and Dogfood

Goal:

- prove the stronger handoff and GC designs on real non-`cmon` tasks

Deliverables:

- at least one real task showing packet-strength handoff
- at least one real task showing targeted artifact GC or supersession

Expected repo impact:

- validate whether helper automation is actually needed

## 9. Recommended Immediate Sequence

The next implementation sequence should be:

1. define the handoff packet model
2. define artifact lifecycle classes and states
3. connect `compound`, `revalidate`, and `refresh-knowledge` to that lifecycle model
4. only then decide whether any helper automation is justified

This sequence keeps the work architectural first and automation second.

## 10. Non-Goals

This effort should not become:

- a runtime orchestrator
- a background artifact crawler
- a broad docs rewrite initiative
- a justification to add more mandatory stages
- a collapse of strict execution boundaries in the name of speed

## 11. Recommendation

These two workstreams should be treated as the next serious refinement layer for `cmon`.

They are worth doing because they:

- reinforce the current philosophy
- improve reuse and trust
- reduce silent drift between stages
- improve long-term legibility without widening into a platform

So the recommendation is:

- proceed
- treat this as optimization, not strategy change
- start with handoff packet design first, because artifact lifecycle becomes easier once stage outputs are more explicit

## 12. Related

- `docs/architecture/2026-04-07-stage-transition-contract-v0.md`
- `docs/architecture/2026-04-07-knowledge-maintenance-v0.md`
- `docs/architecture/2026-04-07-auxiliary-skill-invocation-policy-v0.md`
- `docs/architecture/2026-04-07-next-opportunities-and-decisions-v0.md`
