# cmon Verify Depth And Hard Stops v0

Date: 2026-04-08
Status: Draft

This document tightens `cmon:verify` from a simple evidence check into a stronger post-work engineering gate.

It adds three things:

- verification depth
- hard-stop catalog
- conditional specialist escalation

## 1. Why This Exists

The current `cmon:verify` direction is correct, but still too thin compared with the strongest reference patterns.

What mature repos do better:

- `superpowers`
  - evidence before claims
  - no completion claim without a fresh proving command

- `Waza:/check`
  - review depth distinction
  - hard stops before sign-off

- `compound-engineering:ce-review`
  - conditional specialist escalation for risky diffs

`cmon:verify` should absorb the smallest, most portable parts of these ideas without collapsing back into one giant review skill.

## 2. Verification Depth

`cmon:verify` should classify each pass as:

- `quick`
  - small, low-risk, single-surface unit
  - no obvious security, reliability, or contract risk

- `standard`
  - typical feature or bug-fix unit
  - more than one surface, or meaningful user-visible behavior

- `deep`
  - risky or cross-cutting unit
  - touches auth, permissions, data mutation, migrations, external APIs, reliability-sensitive paths, or broad interface contracts

Depth is not only about line count.

It is about risk and proof burden.

## 3. Hard Stops

The following should be treated as hard stops inside `cmon:verify`:

1. no fresh evidence
   - verification did not run in the current execution cycle

2. claim / evidence mismatch
   - the evidence proves a nearby result, not the actual claimed behavior

3. missing approved source truth
   - the unit has no approved plan, or required design reference is missing

4. unapproved plan or design drift
   - the implementation no longer matches the approved artifact package

5. required system-interaction proof missing
   - non-local behavior should have been checked, but was not

6. regression fix without regression proof
   - the bug claim is "fixed", but no evidence shows the failure boundary is now covered

7. risk-sensitive change without matching scrutiny
   - the unit is clearly high-risk, but neither evidence nor specialist scrutiny scales accordingly

## 4. Conditional Specialist Escalation

`cmon:verify` should stay engineering-led by default.

It should not always spawn a specialist matrix.

But it should record when specialist scrutiny is warranted.

Initial escalation classes:

- `security`
  - auth, permissions, public input, secrets, command execution, data exposure

- `reliability`
  - retries, timeouts, background jobs, failure handling, degraded states, idempotency

- `performance`
  - obvious query explosion, loop-heavy transforms, unbounded I/O, cache-sensitive paths

- `contract`
  - API surface, CLI output contract, serialized response shape, migration-sensitive behavior

In v0, these may remain manual recommendations rather than mandatory internal sub-agents.

The key is that `verify` should make the escalation need explicit instead of silently pretending a standard pass was enough.

## 5. Policy Choice

`cmon:verify` should now behave like:

- a default post-work engineering acceptance gate
- depth-aware
- hard-stop aware
- specialist-escalation aware

It should still not become:

- a multi-role pre-work challenge stage
- a giant CE-style reviewer swarm by default
- a runtime-heavy orchestration surface
