# Story 9.2 — Chore recurrence and completion defaults

## Description
Define phase-1 chore-specific defaults for recurrence and completion behavior so newly created chores start with consistent default settings and completion follows the agreed product rules. In phase 1, recurrence for chores is optional, uses the same simple recurrence pattern set as Story 7.3, and remains bounded to a one-year range.

## Acceptance Criteria (Definition of Done)
- New chores default to non-recurring unless the user explicitly selects a recurrence option.
- The allowed phase-1 recurrence patterns for chores are daily, weekday-based, and weekly.
- Weekday-based recurrence for chores means Monday through Friday only and does not support choosing a custom subset of weekdays in phase 1.
- If recurrence is enabled for a chore, recurrence fields include start date and end date, end date is required, and recurrence does not generate occurrences beyond one year from the recurrence start date.
- Newly created chores continue to default to Draft status as defined in Story 9.1, whether the chore is one-time or recurring.
- For a one-time chore, marking the chore Done completes that chore and does not create another occurrence.
- For a recurring chore, marking the current occurrence Done completes only that occurrence and the next scheduled occurrence is created according to the recurrence rule as a new Draft occurrence.
- Phase-1 recurring chore completion does not auto-complete future occurrences or change the recurrence pattern.
- Skipping an individual occurrence, bulk-completing future occurrences, and editing recurrence for past completed occurrences are out of scope for phase 1.

## Dependencies / Blockers (Definition of Ready)
- Story 7.3 available.
- Story 9.1 available.

## Assumptions
- This story defines defaults for chores only.
- This story does not expand into a broader chore workflow redesign or advanced recurrence behavior beyond the agreed phase-1 scope.
- This story reuses the phase-1 recurrence pattern baseline from Story 7.3 instead of introducing chore-specific recurrence options.
- In phase 1, recurrence editing is limited to the recurring chore definition going forward and does not require support for per-occurrence exceptions.

## Testable Outcomes
- Manual test: creating a new chore without selecting recurrence creates a one-time Draft chore.
- Manual test: creating a recurring chore exposes only daily, weekday-based, and weekly options and requires an end date.
- Automated test: recurring chore generation does not create occurrences beyond one year from the recurrence start date.
- Automated test: completing a one-time chore ends that chore without creating another occurrence.
- Automated test: completing a recurring chore marks only the current occurrence Done and leaves the next scheduled occurrence available as a new Draft occurrence.
- Review artifact: the chore default recurrence settings, completion behavior, and explicit out-of-scope recurrence actions are documented clearly enough for QA to validate.

## Open Questions for PO
- None for phase 1.

## Readiness Assessment
**Ready for Development**

Reason: the phase-1 recurrence options, default non-recurring behavior, completion rules for one-time and recurring chores, next-occurrence handling, and out-of-scope recurrence actions are now explicitly defined and aligned with Stories 7.3 and 9.1, making the story implementable and testable.

## Sizing Note
Do not expand into full chore UI redesign.
