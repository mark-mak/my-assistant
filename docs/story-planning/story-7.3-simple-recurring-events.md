# Story 7.3 — Simple recurring events

## Description
Support phase-1 recurring schedule items with a limited set of simple recurrence patterns, including interval, start date, end date, and a bounded recurrence range.

## Acceptance Criteria (Definition of Done)
- The phase-1 supported recurrence patterns are limited to daily, weekday-based, and weekly recurrence.
- A recurring schedule item includes the required recurrence fields for the selected pattern, including interval, start date, and end date.
- Recurrence generation does not create occurrences beyond the agreed maximum range of one year.

## Dependencies / Blockers (Definition of Ready)
- Final recurrence options confirmed.
- Story 7.1 available.

## Assumptions
- This story covers phase-1 recurrence definition and calendar rendering only.
- This story does not include overlap handling beyond existing calendar behavior, reminder behavior, or advanced/custom recurrence patterns.

## Testable Outcomes
- Automated test: recurrence generation follows the supported pattern rules and does not exceed the one-year maximum range.
- Manual test: recurring schedule items appear on the expected calendar dates in the month view.
- Manual test: an unsupported recurrence option is not available in the phase-1 experience.

## Open Questions for PO
- What exactly does "weekday-based" mean in phase 1: every weekday, selected weekdays, or another rule?
- Is end date required for every recurring item, or can recurrence end by the one-year cap without an explicit end date?
- Is the one-year maximum range measured from the recurrence start date, from creation date, or by generated occurrence window?

## Readiness Assessment
**Not Ready for Development**

Reason: the recurrence scope is generally clear, but the exact weekday-based rule, end-date requirement, and one-year range rule still need PO clarification to make implementation and QA verification objective.

## Sizing Note
Keep to phase-1 recurrence only.
