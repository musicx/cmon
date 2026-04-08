# Shared Extra Capabilities Across Skill Repos v0

Date: 2026-04-08
Status: Draft

This document summarizes the major capability clusters that appear across several reference skill repositories outside the base lifecycle already covered by `cmon`.

The comparison focuses on:

- `superpowers`
- `compound-engineering`
- `Waza`
- `gsd-2`

The goal is not to catalog every skill.

The goal is to identify which extra capabilities recur across repos strongly enough to count as shared harness patterns, and which ones remain repo-specific.

## Scope

This comparison is intentionally limited to capabilities outside the current default `cmon` chain:

```text
cmon:understand -> cmon:think -> cmon:design -> cmon:plan -> cmon:work -> cmon:review -> cmon:compound
```

So this document does not re-compare baseline thinking, planning, work, review, or compounding as such.

It asks:

- what else keeps showing up
- how similar those extra capabilities really are
- which ones look worth absorbing into `cmon`

## High-Confidence Shared Capability Clusters

These clusters appear often enough across the reference repos to count as real shared harness patterns rather than isolated repo taste.

### 1. Deep Debugging and Root-Cause Investigation

This is the clearest shared extra capability.

Representative surfaces:

- `superpowers:systematic-debugging`
- `Waza:/hunt`
- `compound-engineering:reproduce-bug`
- `gsd-2:/gsd forensics` and runtime diagnostic flows

Shared pattern:

- do not patch symptoms first
- force a clearer reproduction
- gather evidence before proposing a fix
- state a concrete hypothesis
- narrow the failure boundary before changing code

Important differences:

- `superpowers` expresses this as a hard discipline workflow with the strongest "no fixes before root cause" posture
- `Waza` expresses nearly the same habit in a shorter, lighter form with strong anti-rationalization language
- `compound-engineering` specializes more toward bug reports and reproduction from issue context
- `gsd-2` pushes the same instinct into runtime forensics, supervision, recovery, and blocked-state diagnosis rather than a lightweight habit skill

Judgment:

- this is the strongest candidate for an additional `cmon` skill
- the portable part is the habit and decision discipline, not the `gsd-2` runtime

### 2. Review and Verification Gates Outside the Main Lifecycle

Several repos do not treat "review" as a single terminal phase.

They add lighter review and verification gates around execution and handoff.

Representative surfaces:

- `superpowers:requesting-code-review`
- `superpowers:verification-before-completion`
- `Waza:/check`
- `compound-engineering:ce-review`
- `compound-engineering:resolve-pr-feedback`
- `gsd-2:review`
- `gsd-2` verification ladder and auto-fix retry model

Shared pattern:

- do not trust "done" without evidence
- inspect the diff or work product before merge or handoff
- separate real issues from style noise
- treat review as a recurring control point, not only a final ceremony

Important differences:

- `superpowers` is strongest on mandatory gates between tasks and before completion
- `Waza` packages review, autofix routing, hard stops, and verification into one lighter command
- `compound-engineering` extends beyond review into PR feedback handling and resolution
- `gsd-2` embeds verification more deeply into the orchestrator and task state machine

Judgment:

- this cluster is highly shared
- `cmon` already covers some of it through `cmon:review` and `cmon:pressure-test`
- the gap is a narrower pre-fix or pre-completion gate that is lighter than full `cmon:review`

### 3. Parallelization and Agent Orchestration

Several repos provide a way to split work or review across focused agent runs.

Representative surfaces:

- `superpowers:dispatching-parallel-agents`
- `superpowers:subagent-driven-development`
- `compound-engineering:orchestrating-swarms`
- `compound-engineering` parallel PR feedback resolution
- `gsd-2` multi-worker orchestration and headless parallel execution

Shared pattern:

- keep contexts narrower by splitting tasks
- isolate reviewers or workers by scope
- use parallelism only when units are separable

Important differences:

- `superpowers` uses orchestration as a disciplined execution technique inside a bounded plan
- `compound-engineering` uses orchestration across execution, review, and meta-workflows
- `gsd-2` turns orchestration into part of the runtime itself
- `Waza` mostly avoids this layer

Judgment:

- this is a shared capability, but not an equally shared design priority
- `cmon` should keep absorbing the bounded, scope-aware version rather than runtime-heavy orchestration

### 4. Git and Worktree Isolation

More than one repo explicitly treats workspace isolation as an agent-enabling capability.

Representative surfaces:

- `superpowers:using-git-worktrees`
- `superpowers:finishing-a-development-branch`
- `compound-engineering:git-worktree`
- `gsd-2` worktree isolation and milestone branch strategy

Shared pattern:

- isolate work to reduce cross-task interference
- make branch and workspace hygiene part of the workflow
- reduce accidental context pollution

Important differences:

- `superpowers` keeps this tied to disciplined engineering workflow
- `compound-engineering` turns it into a reusable utility skill
- `gsd-2` builds it into the execution engine
- `Waza` largely stays out of this area

Judgment:

- this is a meaningful shared capability
- it matters operationally, but it is less central to `cmon` than debugging or verification discipline

### 5. External Research and Source Ingestion

Several repos add explicit skills for reading, researching, and synthesizing external material beyond core planning.

Representative surfaces:

- `Waza:/learn`
- `Waza:/read`
- `compound-engineering` research-heavy planning and session-history retrieval
- `gsd-2` research-oriented planning and best-practices surfaces

Shared pattern:

- pull in external material deliberately
- convert it into structured working context
- avoid relying on vague memory when the task depends on outside knowledge

Important differences:

- `Waza` makes this a first-class explicit habit
- `compound-engineering` often embeds it inside planning and memory retrieval rather than standalone "read" skills
- `gsd-2` pushes it into runtime-assisted planning and domain packs
- `superpowers` is relatively lighter here

Judgment:

- this is a real cluster, but weaker than debugging and verification
- it is more about context acquisition than workflow discipline

## Medium-Confidence Shared Capability Clusters

These appear in multiple repos, but with less even coverage.

### 6. Browser-Side Testing and Reproduction

Representative surfaces:

- `compound-engineering:test-browser`
- `compound-engineering:agent-browser`
- `compound-engineering:reproduce-bug` for UI paths
- `gsd-2:agent-browser`
- broader `gsd-2` browser tooling

Shared pattern:

- validate behavior at the interface layer
- reproduce user-visible issues in a real browser
- capture screenshots and concrete evidence

Judgment:

- shared mainly between `compound-engineering` and `gsd-2`
- not a strong consensus across all repos
- intentionally out of scope for `cmon` v1

### 7. Knowledge Maintenance and Historical Memory

Representative surfaces:

- `compound-engineering:ce-compound-refresh`
- `compound-engineering:ce-sessions`
- `gsd-2` `KNOWLEDGE.md`, knowledge commands, reports, history
- `Waza:/learn` as a lighter adjacent form

Shared pattern:

- knowledge should not only be written once
- stale guidance must eventually be revisited
- past work should be retrievable rather than re-derived from scratch

Important differences:

- `compound-engineering` is strongest on durable learning refresh
- `gsd-2` is strongest on runtime-backed memory and history
- `Waza` leans more toward research output than repo-memory maintenance
- `superpowers` is materially weaker here

Judgment:

- this is shared enough to matter
- but it is not evenly present across all repos
- `cmon` has already moved in this direction via `cmon:refresh-knowledge` and `cmon:revalidate`

## Lower-Confidence or Repo-Specific Capabilities

These are useful, but they do not look like strong common patterns across the compared repos.

### Environment Health and Agent Configuration Audit

Representative surfaces:

- `Waza:/health`
- `gsd-2:/gsd doctor`
- `compound-engineering:claude-permissions-optimizer` as a narrower adjacent utility

Judgment:

- important operationally
- not a strong cross-repo common capability in the same way debugging and verification are

### PR Feedback Resolution Automation

Representative surfaces:

- `compound-engineering:resolve-pr-feedback`

Judgment:

- high value
- but not broadly shared in the compared set

### Runtime-Heavy Orchestration, Observability, and Recovery

Representative surfaces:

- `gsd-2` headless orchestration, monitoring, doctor, forensics, reports

Judgment:

- strategically significant
- clearly not a shared lightweight habit pattern
- intentionally out of scope for `cmon`

## Synthesis

If we rank the extra capabilities by how strongly they recur across the compared repos, the rough order is:

1. deep debugging and root-cause investigation
2. review and verification gates
3. parallelization and agent orchestration
4. git and worktree isolation
5. external research and source ingestion
6. knowledge maintenance and historical retrieval
7. browser-side testing and reproduction

The first two are the most important.

They show up across the comparison not just as optional utilities, but as repeat attempts to control failure and improve agent reliability outside the main build loop.

## Decision for `cmon`

Based on this comparison:

1. `cmon` should add a `cmon:debug` skill
   - rooted in portable debugging habit rather than runtime dependence
   - explicitly root-cause-first
   - usable before any fix attempt

2. `cmon` should continue to treat runtime-heavy orchestration, browser QA, and doctor-style ops tooling as non-core
   - those capabilities matter
   - but they are not the best next fit for `cmon`'s design center

3. `cmon` should continue strengthening lightweight pre-fix and pre-completion gates
   - this is where the strongest cross-repo consensus sits

## Related

- `docs/architecture/2026-04-07-core-skills-v0.md`
- `docs/architecture/2026-04-07-next-opportunities-and-decisions-v0.md`
- `docs/architecture/2026-04-07-auxiliary-skill-invocation-policy-v0.md`
