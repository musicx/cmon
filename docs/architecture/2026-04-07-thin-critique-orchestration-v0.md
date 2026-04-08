# cmon Thin Critique Orchestration v0

Date: 2026-04-07
Status: Draft

This document defines the first thin orchestration layer for `cmon` critique surfaces.

It exists because `cmon` now has enough critique and review machinery that manual reuse is starting to fragment:

- `cmon:design` has owner-led challenge
- `cmon:plan` has a pre-work critique stack
- `cmon:work` has an internal review loop
- `cmon:review` has multi-lens synthesis

The goal is to unify how those are invoked without building a runtime-heavy orchestrator.

## 1. Design Choice

`cmon` should not add:

- a daemon
- a scheduler
- a runtime state machine
- a broad delivery platform

`cmon` should add:

- one thin auxiliary skill
- one manifest template
- one summary template
- one shared stage-transition output

This keeps orchestration at the documentation and prompt-contract layer.

## 2. Auxiliary Skill

The orchestration surface is:

- `cmon:pressure-test`

This is intentionally not a core lifecycle stage.

It is a reusable helper that runs the right existing critique surface for an artifact that already exists.

## 3. Supported Targets

### Design artifacts

Use the already-defined design challenge stack:

- challenger prompts
- design synthesizer

Output:

- transition decision for `cmon:design -> cmon:plan`

### Plan artifacts

Use the already-defined plan critique stack:

- design consistency
- engineering feasibility
- scope risk
- critique summary merge

Output:

- transition decision for `cmon:plan -> cmon:pressure-test`

### Work handoff packages

Use the already-defined internal review loop:

- spec compliance review
- code-quality review

Output:

- transition decision for `cmon:work -> cmon:verify`

### Review packets

Use the already-defined review synthesis surface and packet completeness check.

Output:

- transition decision for:
  - `cmon:review -> cmon:compound`
  - `cmon:review -> complete`
  - `cmon:review -> cmon:work`

## 4. Required Templates

Use:

- `templates/workflow/pressure-test-run-manifest-template.md`
- `templates/workflow/pressure-test-summary-template.md`
- `templates/workflow/stage-transition-decision-template.md`

## 5. Why This Is Worth Doing

This adds three concrete benefits:

1. a stable operator-facing entry point for critique reuse
2. one consistent readiness decision shape across multiple stages
3. a future bridge into helper automation that does not require a runtime redesign

## 6. What It Does Not Do

This layer does not:

- replace the underlying stage skills
- invent new reviewer families
- automate artifact discovery beyond what current stage contracts already support
- turn critique into a mandatory heavy ceremony for every tiny change

## 7. Immediate Follow-Up

After this layer exists, the next priority is:

- knowledge-maintenance upgrades around `cmon:compound`

The next optional follow-up after that is:

- light helper automation for `cmon:pressure-test`, but only if repeated manual use shows real payoff

## 8. Related

- `docs/architecture/2026-04-07-stage-transition-contract-v0.md`
- `docs/architecture/2026-04-07-next-opportunities-and-decisions-v0.md`
