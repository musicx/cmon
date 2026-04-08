# cmon Refresh-Knowledge Operating Procedure v0

Date: 2026-04-07
Status: Draft

This procedure describes how to run one targeted `cmon:refresh-knowledge` pass.

## 1. Inputs

Start from:

- a narrow topic or module scope
- candidate docs to inspect
- newer evidence or source artifacts

Then fill:

- `templates/compound/knowledge-refresh-manifest-template.md`

## 2. Step 1: Lock Refresh Scope

Define:

- what knowledge area is under review
- which docs are in scope
- which evidence is newer or more trustworthy

If the scope is broad and vague, narrow it before proceeding.

## 3. Step 2: Inspect Existing Docs

For each in-scope doc, check:

- title and problem framing
- examples and references
- overlap with sibling docs
- whether current repo reality still supports the guidance

## 4. Step 3: Compare Against Newer Evidence

Use newer source artifacts to decide whether the doc should be:

- updated
- consolidated
- narrowed
- deprecated
- left alone

## 5. Step 4: Write The Refresh Summary

Use:

- `templates/compound/knowledge-refresh-summary-template.md`

Then record:

- `templates/workflow/stage-transition-decision-template.md`

## 6. Step 5: Route

Possible outcomes:

- `proceed -> complete`
- `revise -> cmon:refresh-knowledge`
- `block`

## 7. Failure Cases

Stop and surface the issue when:

- the scope is too broad to review responsibly
- newer evidence is still too ambiguous
- no clear replacement exists for a doc that appears stale
