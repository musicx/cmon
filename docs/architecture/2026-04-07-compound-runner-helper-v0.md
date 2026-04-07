# cmon Compound Runner Helper v0

Date: 2026-04-07
Status: Draft

This document defines the helper layer for `cmon:compound`.

## 1. Purpose

The helper exists to make knowledge capture repeatable and non-duplicative.

It should:

- assemble trigger evidence consistently
- assemble the shared compound context
- wrap the three curator calls consistently
- prepare synthesis input deterministically
- support new-doc versus update-existing decisions

It should not become a broad historical maintenance runtime.

## 2. Inputs

Minimum logical inputs:

- completed work summary
- accepted review outcome or equivalent evidence

Optional explicit inputs:

- related solution doc paths
- preferred output target
- explicit trigger hint

Preferred starting manifest:

- `templates/compound/compound-run-manifest-template.md`

## 3. Outputs

The helper should produce:

- a trigger classification
- a shared compound context bundle
- three curator invocation packets
- one synthesizer packet
- one merged compound decision

## 4. Constraints

The helper must:

- avoid duplicates when update-existing is the right choice
- keep trigger reasoning visible
- avoid documenting trivial work
- preserve lens-specific value

## 5. Next Step

This helper contract now has a matching manual operating procedure:

- `docs/architecture/2026-04-07-compound-operating-procedure-v0.md`

After this contract, the next useful addition is:

- an end-to-end example that exercises the trigger checklist, curator outputs, and final compound decision together
