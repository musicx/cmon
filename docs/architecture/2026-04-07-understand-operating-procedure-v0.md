# cmon Understand Operating Procedure v0

Date: 2026-04-07
Status: Draft

This procedure describes how to run one `cmon:understand` pass end to end.

It is intentionally manual-first.

## 1. Inputs

Before starting, collect:

- task summary
- any explicit paths or repo area hints
- any existing artifact paths already known

Then create:

- `templates/understand/understand-run-manifest-template.md`

## 2. Step 1: Lock The Understanding Scope

Record:

- what needs to be understood
- where understanding should begin
- what next skill is expected, if already known

If the task is too vague to identify even a starting repo area, stop and clarify the task first.

## 3. Step 2: Build Shared Context

Read:

- `AGENTS.md`
- relevant docs in `docs/`
- any matching prior artifacts in `docs/brainstorms/`, `docs/plans/`, `docs/solutions/`, and `docs/architecture/`

Inspect the nearby code area enough to verify structure and patterns.

Then fill:

- `templates/understand/understand-context-template.md`

## 4. Step 3: Run The Three Observers

Dispatch:

- product observer
- engineer observer
- ops observer

Wrap each with:

- `templates/understand/lens-invocation-template.md`

Each observer should stay in its lens.

## 5. Step 4: Synthesize The Context Packet

Assemble the outputs using:

- `templates/understand/synthesizer-input-template.md`

Then run:

- `agents/understand/understand-synthesizer.md`

The result should identify:

- relevant repo area
- existing artifacts
- patterns and constraints
- open questions
- the recommended next skill

## 6. Step 5: Route To The Next Skill

Default next steps:

- `cmon:brainstorm` if scope or problem framing is still open
- `cmon:plan` if requirements are already clear
- `cmon:review` if the task is to assess an existing change

## 7. Failure Cases

Stop and surface the issue when:

- repo structure is still ambiguous after local inspection
- no relevant artifact or code area can be located
- one lens reveals a major uncertainty that changes the next skill decision

`cmon:understand` should end with a sharper context packet, not with guessed certainty.
