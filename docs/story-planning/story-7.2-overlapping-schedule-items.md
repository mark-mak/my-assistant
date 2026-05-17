# Story 7.2 — Overlapping schedule items

## Description
Support overlapping schedule items so multiple items that share the same date or time range can be stored and displayed without data loss or rendering failure.

## Acceptance Criteria (Definition of Done)
- Multiple in-scope schedule items with overlapping dates or times can be stored and displayed.
- Overlapping schedule items are rendered without losing item data or causing calendar rendering failure.
- The agreed overlap display treatment is applied consistently wherever overlapping items appear in the in-scope calendar view.

## Dependencies / Blockers (Definition of Ready)
- Story 7.1 available.
- Overlap rendering approach chosen.

## Assumptions
- This story covers overlap support only.
- This story does not include recurrence behavior, reminder behavior, or alternate calendar views.

## Testable Outcomes
- Manual test: multiple overlapping schedule items appear in the month view without rendering failure.
- Automated test: overlapping schedule item data is preserved when saved and retrieved.
- Manual test: the selected overlap display treatment is applied consistently for overlapping items in the in-scope calendar view.

## Open Questions for PO
- What specific overlap display treatment is expected in phase 1 so overlapping items are considered understandable?
- Are overlaps limited to the month view in Story 7.1, or are additional views in scope for this story?
- Which schedule item types are included if different item types can overlap in the same calendar view?

## Readiness Assessment
**Not Ready for Development**

Reason: the story intent is clear, but the expected overlap display treatment and exact in-scope views/item types are still undefined, so implementation and QA cannot verify success objectively.

## Sizing Note
Do not include recurrence here.
