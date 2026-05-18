# Story 7.1 — Calendar month view

## Description
Implement a month-view calendar for family-group-scoped schedule items so users can view items in a monthly calendar layout. In phase 1, this story covers non-recurring schedule items only and includes basic month-to-month navigation within the month view.

## Acceptance Criteria (Definition of Done)
- The calendar displays schedule items in a month-view layout.
- The phase-1 in-scope schedule item types for this story are one-off family-group-scoped schedule items with a scheduled date or start date/time.
- Recurring schedule items, reminder-only items, and due-soon-only representations are out of scope for this story and are handled in later stories.
- Each in-scope schedule item appears on the correct calendar date based on the agreed timezone behavior.
- Default timezone behavior follows HKT, consistent with shared product defaults.
- The month view includes basic month navigation that lets the user move to the previous month and next month.
- The month view also includes a way to return to the current month.
- When the selected month has no in-scope schedule items, the month grid still renders and the UI shows a clear empty-state message indicating there are no schedule items for that month.

## Dependencies / Blockers (Definition of Ready)
- Story 1.3 available.
- Calendar data available.

## Assumptions
- This story covers month-view rendering only.
- This story covers one-off schedule items only in phase 1.
- This story includes basic previous-month, next-month, and return-to-current-month navigation within the month view.
- This story does not include overlap handling, recurring events, reminders, or alternate calendar views.

## Testable Outcomes
- Manual test: the month calendar renders the expected in-scope schedule items for the selected month.
- Manual test: schedule items appear on the correct calendar dates under the HKT default timezone behavior.
- Manual test: a month with no in-scope schedule items displays the empty-state message without calendar rendering failure.
- Manual test: user can navigate to previous and next months from the month view.
- Manual test: user can return from another month to the current month.

## Open Questions for PO
- None for phase 1.

## Readiness Assessment
**Ready for Development**

Reason: the phase-1 in-scope schedule item types, empty-state behavior, and month-navigation scope are now explicitly defined, keeping the story aligned with the PRD and the later calendar stories while making implementation and QA checks objective.

## Sizing Note
Month view only.
