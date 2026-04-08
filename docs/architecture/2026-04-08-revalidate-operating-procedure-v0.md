# cmon Revalidate Operating Procedure v0

Date: 2026-04-08
Status: Draft

Use this procedure when artifact trust should be rechecked without widening immediately into maintenance work.

## Inputs

Bring:

- a clear audit scope
- candidate artifact paths or artifact family
- current canonical contracts or newer evidence

## Procedure

1. Lock the audit scope with `templates/workflow/revalidate-run-manifest-template.md`.
2. Collect the artifacts in scope and the newer source of truth.
3. Classify each artifact as trustworthy, stale, overlapping, duplicated, too broad, superseded, or unclear.
4. Choose the smallest justified action:
   - keep
   - refresh
   - supersede
   - archive
   - ignore_for_now
5. If the follow-up is a narrow maintenance problem, route it to `cmon:refresh-knowledge`.
6. If the issue is obvious and local, allow a direct narrow update instead of forcing a maintenance sub-workflow.
7. Record the result in `templates/workflow/revalidate-summary-template.md`.
8. Emit the stage transition decision.

## Review Questions

Before closing, verify:

- the audit did not silently widen
- the newer source of truth was named explicitly
- actions were proportional to the evidence
- `refresh-knowledge` was used only when a true narrow maintenance pass is justified

## Related

- `docs/architecture/2026-04-08-revalidate-execution-v0.md`
- `docs/architecture/2026-04-07-auxiliary-skill-invocation-policy-v0.md`
