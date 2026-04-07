# cmon Think Runner Helper v0

Date: 2026-04-07
Status: Draft

This document defines the helper layer currently used by `cmon:think`.

## 1. Purpose

The helper exists to make multi-lens thinking repeatable.

It should:

- assemble the shared think context
- wrap the three lens calls consistently
- prepare synthesis input deterministically
- support writing one durable output artifact when needed

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

- `templates/think/think-run-manifest-template.md`

## 3. Outputs

The helper should produce:

- a shared think context bundle
- three thinker invocation packets
- one synthesizer packet
- one merged think decision
- one durable artifact when the selected mode requires one

## 4. Constraints

The helper must:

- keep the product, engineering, and operations lenses distinct
- keep blockers visible
- avoid writing implementation plans
- avoid starting code

## 5. Next Step

This helper contract now has a matching manual operating procedure:

- `docs/architecture/2026-04-07-think-operating-procedure-v0.md`

After this contract, the next useful addition is:

- an end-to-end example that exercises the think templates and synthesizer together
