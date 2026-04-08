---
title: workflow proof coverage reference
type: requirements
status: active
date: 2026-04-07
---

# Workflow Proof Coverage Requirements

## Problem

The repo now has multiple end-to-end examples, but operators still have to infer which workflow claims are already proved and which remain aspirational.

## Requirements

- R1. Add one compact reference for workflow proof coverage.
- R2. Surface that reference from the highest-value summary layer.
- R3. Keep the task bounded to proof coverage rather than historical cleanup.
- R4. If execution reveals that one or two summary docs must change to preserve truth, record the expansion explicitly.

## Success Criteria

- operators can tell which examples prove which behaviors
- the task remains bounded even if one narrow expansion is needed
