# cmon Review Runner Helper v0

Date: 2026-04-07
Status: Draft

Legacy note: this helper belongs to the older `cmon:review` surface.
It is retained for compatibility and historical examples, not as the canonical current stage.

This document defines the first helper layer for `cmon:review`.

The helper exists to make review execution repeatable without turning `cmon` into a runtime-heavy system.

## 1. Purpose

The review runner helper is a narrow execution shim for `cmon:review`.

It should:

- collect review inputs consistently
- assemble the shared review context bundle
- wrap reviewer invocations in a stable shape
- prepare synthesis input in a deterministic format

It should not become a general workflow orchestrator.

## 2. What The Helper Is Not

The review runner helper is not:

- the full `cmon` lifecycle controller
- `cmon:work`
- an auto-fix engine
- a runtime daemon
- a broad `gstack`-style delivery chain

The helper only stabilizes one node in the chain:

`cmon:review`

## 3. Why This Layer Exists

Without a helper layer, review quality drifts because each invocation may:

- choose a different base ref
- omit intent artifacts
- package verification evidence inconsistently
- let reviewers infer different scopes

The helper reduces that drift.

This is especially important because `cmon` requires:

- product review
- engineering review
- operations review
- conservative synthesis

Those only work if the inputs are structurally consistent.

## 4. Responsibilities

The helper has five responsibilities.

### 4.1 Resolve Review Scope

Determine:

- base ref
- changed files
- diff target
- whether untracked files are in scope

Default base resolution stays:

1. `origin/main`
2. `origin/master`
3. explicit human input if neither exists

### 4.2 Resolve Intent Inputs

Resolve:

- requirements or design artifact
- implementation plan
- verification evidence
- verification summary from `cmon:verify` when one exists
- work execution report
- scope expansion request when present

The helper should prefer explicit paths when available.

If something is missing, it must record the gap rather than hide it.

### 4.3 Assemble Shared Context

Render the shared context using:

- `templates/review/reviewer-context-template.md`

This is the single source of truth for reviewer scope.

### 4.4 Wrap Reviewer Calls

Render three reviewer invocations using:

- `templates/review/lens-reviewer-invocation-template.md`

One invocation per lens:

- `product`
- `engineering`
- `operations`

### 4.5 Prepare Synthesis Input

After reviewer outputs exist, render synthesis input using:

- `templates/review/synthesizer-input-template.md`

This produces the final packet for:

- `agents/review/review-synthesizer.md`

## 5. Inputs

The helper should accept these inputs, whether they are passed explicitly or inferred from context.

### Required Logical Inputs

- review target
- base ref or base-ref inference permission

### Optional Explicit Inputs

- requirements or design artifact path
- implementation plan path
- verification evidence notes
- verification summary path
- work execution report path
- scope expansion request path
- changed-file allowlist
- untracked-file include note
- review scope notes

### Mode Input

The helper may later support:

- `session_local`
- `persist_artifacts`

In v0, assume `session_local` by default.

## 6. Outputs

The helper should produce four outputs.

### 6.1 Scope Summary

- resolved base ref
- changed files
- scope notes

### 6.2 Shared Review Context Bundle

The rendered bundle for all lens reviewers.

### 6.3 Lens Invocation Packets

Three rendered reviewer packets:

- product
- engineering
- operations

### 6.4 Synthesizer Packet

One rendered input packet for the synthesizer.

The final synthesized review remains the canonical review result.

## 7. Recommended Artifact Shape

The helper should use one invocation manifest as its starting point.

Use:

- `templates/review/review-run-manifest-template.md`

That manifest is not the final review output.

It is the input contract that tells the helper what to resolve and what to trust.

## 8. Execution Flow

```text
manifest -> scope resolution -> artifact resolution -> shared bundle
        -> three lens invocation packets -> reviewer outputs
        -> synthesizer packet -> final review decision
```

This is intentionally narrow.

It is a helper for `cmon:review`, not a replacement for the top-level skill chain.

## 9. Policy Constraints

The helper must follow these constraints:

- do not mutate code
- do not auto-fix `safe_auto` findings
- do not silently drop missing artifacts
- do not let reviewers choose different scopes
- do not perform overall lifecycle orchestration

If the final decision is `requires_fixes`, the next active skill is still:

- `cmon:work`

If the final decision creates a reusable lesson, the next skill is:

- `cmon:compound`

## 10. Why This Matches cmon Philosophy

This design keeps the benefits of structure without importing a heavy runtime model.

It borrows the mature part of existing systems:

- deterministic review assembly
- stable role inputs
- conservative synthesis

while rejecting what `cmon` does not want in v0:

- large runtime machinery
- broad autonomous chaining
- hidden mutation during review

## 11. Next Step

After this helper contract is accepted, the next implementation layer should be one of:

1. a manual operating procedure that uses the manifest and templates directly
2. a lightweight local script that renders the helper packets without dispatch automation
