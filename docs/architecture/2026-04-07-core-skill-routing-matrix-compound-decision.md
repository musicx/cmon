## Compound Decision
- Status: mandatory
- Artifact Mode: new_pattern
- Trigger Basis:
  - review surfaced a reusable acceptance heuristic
  - the work created a pattern likely to recur in the same area
  - future planning would be meaningfully better with this lesson documented
- Summary: This work produced a durable workflow pattern: once a harness repo accumulates explicit stages and artifacts, it should expose a compact operator-facing routing matrix. The review also surfaced a reusable acceptance heuristic about bounded docs work and follow-up handling.

## Reusable Lesson
- when a harness repo becomes structurally rich enough that operators can mis-sequence stages, add a short routing matrix that explains when to use each core skill, what it requires, and what it should produce

## Why It Matters
- Product: operators get faster entry into the right stage without reading every deep design doc first
- Engineering: workflow structure becomes easier to maintain when stage boundaries are summarized in one stable reference
- Operations: the guidance stays lightweight and explicit instead of quietly implying hidden runtime orchestration

## Existing Doc Action
- Path: none
- Action: none

## Recommended Output Target
- `docs/solutions/...`
