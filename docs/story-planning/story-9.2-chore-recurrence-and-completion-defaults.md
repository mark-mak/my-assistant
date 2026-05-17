# Story 9.2 — Chore recurrence and completion defaults

## Description
Define phase-1 chore-specific defaults for recurrence and completion behavior so newly created chores start with consistent default settings and completion follows the agreed product rules.

## Acceptance Criteria (Definition of Done)
- New chores use the agreed default recurrence settings consistently.
- Chore completion behavior follows the agreed phase-1 completion rules.
- The default recurrence settings and completion rules are explicitly documented for implementation and QA.

## Dependencies / Blockers (Definition of Ready)
- Story 7.3 available.
- Product decisions finalized for chore completion behavior.

## Assumptions
- This story defines defaults for chores only.
- This story does not expand into a broader chore workflow redesign or advanced recurrence behavior beyond the agreed phase-1 scope.

## Testable Outcomes
- Manual test: creating a new chore applies the expected default recurrence settings.
- Automated test: chore completion behavior follows the documented phase-1 default rules.
- Review artifact: the chore default recurrence settings and completion rules are documented clearly enough for QA to validate.

## Open Questions for PO
- What are the exact default recurrence settings for a new chore in phase 1?
- What is the exact default completion behavior for chores in phase 1?
- Are any chore types or views intentionally excluded from these defaults?

## Readiness Assessment
**Not Ready for Development**

Reason: the story intent is clear, but the exact default recurrence settings, the completion rule, and any in-scope exclusions still need PO clarification before implementation and QA can verify the behavior objectively.

## Sizing Note
Do not expand into full chore UI redesign.
