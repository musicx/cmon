# cmon Thin Critique Orchestration v0

Date: 2026-04-07
Status: Draft

This document defines the first thin orchestration layer for `cmon` critique surfaces.

It exists because `cmon` now has enough critique machinery that manual reuse is starting to fragment:

- `cmon:design` has owner-led challenge
- `cmon:plan` has a pre-work critique stack
- `cmon:challenge` has multi-lens synthesis for pre-work artifact challenge

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

- `cmon:challenge`

This is now a core pre-work lifecycle stage rather than a generic helper.

It runs the right existing critique surface for a proposed design / plan package that already exists.

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

- transition decision for `cmon:plan -> cmon:challenge`

## 4. Required Templates

Use:

- `templates/workflow/challenge-run-manifest-template.md`
- `templates/workflow/challenge-summary-template.md`
- `templates/workflow/stage-transition-decision-template.md`

## 5. Why This Is Worth Doing

This adds three concrete benefits:

1. a stable operator-facing entry point for pre-work critique reuse
2. one consistent readiness decision shape across multiple stages
3. a future bridge into helper automation that does not require a runtime redesign

## 6. What It Does Not Do

This layer does not:

- replace the underlying stage skills
- invent new reviewer families
- automate artifact discovery beyond what current stage contracts already support
- turn critique into a mandatory heavy ceremony for every tiny change
- expand back into post-work review orchestration

## 7. Immediate Follow-Up

After this layer exists, the next priority is:

- knowledge-maintenance upgrades around `cmon:compound`

The next optional follow-up after that is:

- light helper automation for `cmon:challenge`, but only if repeated manual use shows real payoff

## 8. Related

- `docs/architecture/2026-04-07-stage-transition-contract-v0.md`
- `docs/architecture/2026-04-07-next-opportunities-and-decisions-v0.md`
