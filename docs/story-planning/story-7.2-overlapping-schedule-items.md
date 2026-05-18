# Story 7.2 — Overlapping schedule items

## Description
Support overlapping schedule items so multiple in-scope schedule items that share the same date or time range can be stored and displayed without data loss or rendering failure. In phase 1, overlap support is limited to the month view and applies only to one-off family-group-scoped schedule items.

## Acceptance Criteria (Definition of Done)
- Multiple in-scope schedule items with overlapping dates or times can be stored and displayed.
- Overlapping schedule items are rendered without losing item data or causing calendar rendering failure.
- In phase 1, overlap support is limited to the month view from Story 7.1.
- In phase 1, the in-scope overlapping item types are one-off family-group-scoped schedule items with a scheduled date or start date/time.
- Recurring schedule items and reminder-only items are out of scope for this story and handled in later stories.
- When multiple overlapping in-scope items fall on the same day in the month view, the day cell shows them as separate stacked entries up to the visible space available in that cell.
- If more overlapping items exist than can be shown directly in the day cell, the cell shows a `+N more` overflow indicator so users can see that additional items exist for that date.
- The same overlap display treatment is applied consistently wherever overlapping items appear in the in-scope month view.

## Dependencies / Blockers (Definition of Ready)
- Story 7.1 available.

## Assumptions
- This story covers overlap support only.
- This story is limited to the month view only in phase 1.
- This story does not include recurrence behavior, reminder behavior, or alternate calendar views.

## Testable Outcomes
- Manual test: multiple overlapping schedule items appear in the month view without rendering failure.
- Automated test: overlapping schedule item data is preserved when saved and retrieved.
- Manual test: overlapping one-off schedule items appear as separate stacked entries in the same day cell when space allows.
- Manual test: when overlapping items exceed visible cell space, the month view shows a `+N more` overflow indicator.
- Manual test: overlap behavior is limited to the month view and does not introduce new alternate-view requirements.

## Open Questions for PO
- None for phase 1.

## Readiness Assessment
**Ready for Development**

Reason: the phase-1 overlap display treatment, month-view-only scope, and in-scope item types are now explicitly defined, making the story aligned with Stories 7.1 and 7.3 and ready for implementation and QA.

## Sizing Note
Do not include recurrence here.
