# cmon Refresh-Knowledge Rubric v0

Date: 2026-04-07
Status: Draft

This rubric defines how `cmon:refresh-knowledge` should classify maintenance problems.

## 1. Purpose

Knowledge maintenance should not depend on vague discomfort.

This rubric turns drift suspicion into explicit categories and actions.

## 2. Categories

### `stale`

Use when:

- examples or references no longer match current repo reality
- the lesson is still basically correct, but its details lag behind

Default action:

- `update_existing`

### `overlap`

Use when:

- two docs cover materially similar lessons
- but they are not literal duplicates

Signals:

- same problem frame
- same root pattern
- same target audience
- repeated prevention guidance

Default action:

- `consolidate` when one doc can absorb the other cleanly
- otherwise `narrow`

### `duplicate`

Use when:

- two docs effectively say the same thing
- keeping both would only increase drift risk

Default action:

- `consolidate`

### `too_broad`

Use when:

- a pattern doc claims guidance that current evidence only supports in a narrower scope

Default action:

- `narrow`

### `contradicted`

Use when:

- newer evidence shows the old guidance is no longer trustworthy

Default action:

- `deprecate` or `update_existing`, depending on whether the old doc can be repaired cleanly

### `none`

Use when:

- the suspected issue is weak
- or the current docs still hold up

Default action:

- `keep_as_is`

## 3. Evidence Strength

Prefer maintenance action only when supported by:

- newer accepted workflow artifacts
- newer solution docs
- newer plans or design decisions
- current repo structure that directly contradicts older guidance

Weak evidence examples:

- wording preference only
- speculative fear of drift
- overlap that is merely topical rather than actually redundant

## 4. Tie-Break Rule

When two actions seem plausible, choose the smaller one:

- update before consolidate
- narrow before deprecate
- keep as-is before broad rewrite

unless the smaller action clearly leaves future drift risk in place.
