# Story 7.3 — Simple recurring events

## Description
Support phase-1 recurring schedule items with a limited set of simple recurrence patterns, including interval, start date, end date, and a bounded recurrence range. In phase 1, weekday-based recurrence means every weekday from Monday through Friday, end date is required, and recurrence generation is capped to a one-year window measured from the recurrence start date.

## Acceptance Criteria (Definition of Done)
- The phase-1 supported recurrence patterns are limited to daily, weekday-based, and weekly recurrence.
- Weekday-based recurrence means the item repeats on every weekday, Monday through Friday, and does not support selecting a custom subset of weekdays in phase 1.
- A recurring schedule item includes the required recurrence fields for the selected pattern, including interval, start date, and end date.
- End date is required for every recurring schedule item in phase 1.
- Recurrence generation does not create occurrences beyond one year from the recurrence start date, even if a later end date is entered.
- If a requested recurrence range would exceed one year from the start date, the system does not allow occurrences beyond that one-year window.

## Dependencies / Blockers (Definition of Ready)
- Story 7.1 available.

## Assumptions
- This story covers phase-1 recurrence definition and calendar rendering only.
- This story applies recurring schedule items into the month-view experience after the base month view from Story 7.1.
- Weekday-based recurrence is fixed to Monday through Friday in phase 1.
- This story does not include overlap handling beyond existing calendar behavior, reminder behavior, or advanced/custom recurrence patterns.

## Testable Outcomes
- Automated test: recurrence generation follows the supported daily, weekday-based, and weekly rules and does not exceed the one-year maximum range measured from start date.
- Manual test: recurring schedule items appear on the expected calendar dates in the month view.
- Manual test: weekday-based recurrence appears on weekdays only and does not create weekend occurrences.
- Manual test: recurring schedule items cannot be saved without an end date.
- Manual test: an unsupported recurrence option is not available in the phase-1 experience.

## Open Questions for PO
- None for phase 1.

## Readiness Assessment
**Ready for Development**

Reason: the phase-1 recurrence patterns, weekday-based rule, end-date requirement, and one-year range measurement are now explicitly defined, making the story implementable and testable while staying aligned with the PRD and Story 7.1.

## Sizing Note
Keep to phase-1 recurrence only.
