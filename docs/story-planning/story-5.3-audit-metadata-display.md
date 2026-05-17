# Story 5.3 — Audit metadata display

## Description
Display audit metadata for last updated at and last updated by in the defined in-scope detail and list/table views.

## Acceptance Criteria (Definition of Done)
- Each in-scope detail view displays last updated at and last updated by when that metadata is available.
- Each in-scope list/table view displays the required audit metadata fields when that metadata is available.
- Views covered by this story handle missing audit metadata using the agreed fallback behavior.

## Dependencies / Blockers (Definition of Ready)
- Updated-at and updated-by available in data layer.
- In-scope detail views identified.
- In-scope list/table views identified.

## Assumptions
- This story covers display of existing audit metadata only.
- This story does not include adding or changing audit write logic.

## Testable Outcomes
- Manual test: each in-scope detail view shows last updated at and last updated by when the data is present.
- Manual test: each in-scope list/table view shows the required audit metadata when the data is present.
- Manual test: a record with missing audit metadata follows the agreed fallback behavior without breaking the view.

## Open Questions for PO
- Which specific detail views are in scope for phase 1?
- Which specific list/table views are in scope for phase 1?
- What is the expected fallback behavior when last updated at or last updated by is missing: hide the field, show a placeholder, or use another display rule?

## Readiness Assessment
**Not Ready for Development**

Reason: the story objective is clear, but the exact target views and the missing-metadata display rule are still undefined, so implementation scope and QA expectations are not yet objective.

## Sizing Note
Display only; do not add audit write logic here.
