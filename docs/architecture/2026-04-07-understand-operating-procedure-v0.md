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
- the most likely next stage, if already obvious

Then create:

- `templates/understand/understand-run-manifest-template.md`

## 2. Step 1: Lock The Understanding Scope

Record:

- what needs to be understood
- where understanding should begin
- what next skill is expected, if already known
- what would count as a sufficient packet for that next skill

If the task is too vague to identify even a starting repo area, stop and clarify the task first.

## 3. Step 2: Build Shared Context

Read:

- `AGENTS.md`
- relevant docs in `docs/`
- any matching prior artifacts in `docs/brainstorms/`, `docs/plans/`, `docs/solutions/`, and `docs/architecture/`

Inspect the nearby code area enough to verify structure and patterns.

Check repo foundation state explicitly:

- does the target directory already exist
- is it already a git repository
- if not, is this substantial enough that durable artifacts and code should be tracked from the start

If the answer is yes and the directory is still not a git repo:

- initialize git immediately when this is clearly a new substantial project root
- otherwise record it clearly in the packet so later stages do not treat repo state as invisible

Explicitly recover:

- any prior brainstorm, design, or plan that should constrain the next stage
- any solution doc or pattern doc that should be reused
- any repo-local pattern the next stage should follow

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

Each observer should cite actual artifacts or paths when possible.

## 5. Step 4: Synthesize The Context Packet

Assemble the outputs using:

- `templates/understand/synthesizer-input-template.md`

Then run:

- `agents/understand/understand-synthesizer.md`

The result should identify:

- relevant repo area
- existing artifacts
- prior learnings
- patterns and constraints
- open questions
- packet readiness
- the recommended next skill

## 6. Step 5: Route To The Next Skill

Default next steps:

- `cmon:think` if scope, direction, or problem framing is still open
- `cmon:design` if requirements exist but flows, states, or boundaries still need explicit design
- `cmon:plan` if requirements and design are already clear enough
- `cmon:verify` if the task is to assess an existing implemented change

## 7. Failure Cases

Stop and surface the issue when:

- repo structure is still ambiguous after local inspection
- no relevant artifact or code area can be located
- one lens reveals a major uncertainty that changes the next skill decision
- the packet still names files and docs but does not explain why they matter downstream

`cmon:understand` should end with a sharper context packet, not with guessed certainty.
