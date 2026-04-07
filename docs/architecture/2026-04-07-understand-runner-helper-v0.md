# cmon Understand Runner Helper v0

Date: 2026-04-07
Status: Draft

This document defines the helper layer for `cmon:understand`.

## 1. Purpose

The helper exists to make context recovery structurally consistent.

It should:

- assemble the shared understand context
- wrap the three observer calls consistently
- prepare synthesis input deterministically

It should not become a general repo research runtime.

## 2. Inputs

Minimum logical inputs:

- task summary
- repo area or permission to infer it

Optional explicit inputs:

- artifact paths
- code paths
- next-skill expectation

Preferred starting manifest:

- `templates/understand/understand-run-manifest-template.md`

## 3. Outputs

The helper should produce:

- a shared understand context bundle
- three observer invocation packets
- one synthesizer packet
- one merged context packet

## 4. Constraints

The helper must:

- stay narrow
- avoid implementation planning
- avoid design recommendations beyond next-step routing
- preserve uncertainty instead of hiding it

## 5. Next Step

This helper contract now has a matching manual operating procedure:

- `docs/architecture/2026-04-07-understand-operating-procedure-v0.md`

After this contract, the next useful addition is:

- an end-to-end example that exercises the understand templates and observers together
