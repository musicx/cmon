# Delegated Unit Packet

## Parent Work Context

- Plan Path: <docs/plans/...>
- Parent Unit ID Or Title: <unit id>
- Execution Strategy: <serial | parallel>
- Repo Root Or Project Directory: <path>

## Delegated Slice

- Slice ID Or Title: <sub-step name>
- Goal: <what this delegated slice must accomplish>
- Files In Scope:
  - <file>
  - <file>
- Explicit Constraints:
  - <constraint>
  - <constraint>
- Patterns To Follow:
  - <existing file or convention>
- Out Of Scope:
  - <non-goal>
  - <non-goal>

## Verification Contract

- Verification Target:
  - <test/build/manual verification>
- Done Condition:
  - <behavioral result>
  - <evidence result>
- Stop Condition:
  - <condition requiring return to parent executor>

## Handoff Contract

- Return:
  - implemented slice summary
  - files changed
  - verification evidence
  - unresolved blockers
- Do Not:
  - widen write scope silently
  - resolve upstream design or plan ambiguity locally
