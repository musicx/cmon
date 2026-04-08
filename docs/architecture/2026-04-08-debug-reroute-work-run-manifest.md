# Work Run Manifest

## Unit

- Plan or source: `docs/architecture/2026-04-08-debug-skill-v0.md`
- Unit goal: operationalize `cmon:debug` enough that it can support a bounded investigation pass

## Initial Scope

- `skills/debug/SKILL.md`
- `docs/architecture/2026-04-08-debug-skill-v0.md`

## Constraints

- do not introduce runtime-heavy orchestration
- keep `cmon:debug` habit-oriented rather than stack-specific
- do not silently convert debugging into fixing

## Verification Target

- `cmon:debug` should reference concrete templates and operating docs rather than only philosophy

## Stop Condition

- stop if the current unit cannot produce a clean investigation handoff without inventing missing artifacts during execution
