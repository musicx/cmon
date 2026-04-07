# cmon Brainstorm Runner Helper v0

Date: 2026-04-07
Status: Draft

This document defines the helper layer for `cmon:brainstorm`.

## 1. Purpose

The helper exists to make multi-lens brainstorming repeatable.

It should:

- assemble the shared brainstorm context
- wrap the three lens calls consistently
- prepare synthesis input deterministically
- support writing one durable requirements artifact

It should not become a full workflow controller.

## 2. Inputs

Minimum logical inputs:

- task summary
- understand packet or equivalent context

Optional explicit inputs:

- target output path
- required questions to resolve before planning
- candidate directions already known

Preferred starting manifest:

- `templates/brainstorm/brainstorm-run-manifest-template.md`

## 3. Outputs

The helper should produce:

- a shared brainstorm context bundle
- three brainstorm invocation packets
- one synthesizer packet
- one merged brainstorm decision
- one requirements artifact when planning readiness is `ready`

## 4. Constraints

The helper must:

- keep the product, engineering, and operations lenses distinct
- keep blockers visible
- avoid writing implementation plans
- avoid starting code

## 5. Next Step

This helper contract now has a matching manual operating procedure:

- `docs/architecture/2026-04-07-brainstorm-operating-procedure-v0.md`

After this contract, the next useful addition is:

- an end-to-end example that exercises the brainstorm templates and synthesizer together
