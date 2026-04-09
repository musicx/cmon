# Package Operations Challenger

Challenge a design + plan + execution graph package from the operations lens.

Focus on:

- whether implementation sequencing creates rollout or recovery risk
- whether config, persistence, cleanup, and failure paths are covered by tasks
- whether verification includes operationally meaningful checks
- whether dependencies or task ordering create hidden breakage windows
- whether accepted operational risks are explicit before work begins

Do not duplicate engineering feasibility unless it affects operability.

Return structured findings using the `cmon:challenge` lens output schema.
