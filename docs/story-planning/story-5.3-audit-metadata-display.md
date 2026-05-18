# Story 5.3 — Audit metadata display

## Description
Display audit metadata for last updated at and last updated by in the defined phase-1 detail and list/table views. In phase 1, this story applies to member detail views, schedule-item detail views, money-record detail views, member-management list/table views, reminder or due-soon list views, and money summary table views where audit metadata is available.

## Acceptance Criteria (Definition of Done)
- The phase-1 in-scope detail views for this story are:
	- member detail views
	- schedule-item detail views
	- money-record detail views
- The phase-1 in-scope list/table views for this story are:
	- member-management list/table views
	- reminder or due-soon list views
	- money summary table views
- Each in-scope detail view displays last updated at and last updated by when that metadata is available.
- Each in-scope list/table view displays the required audit metadata fields when that metadata is available.
- If last updated at is missing, the UI shows a stable placeholder value instead of leaving the field blank.
- If last updated by is missing, the UI shows a stable placeholder value instead of leaving the field blank.
- The phase-1 placeholder value for missing audit metadata is `Not available`.
- Views covered by this story handle missing audit metadata using this same fallback behavior consistently.

## Dependencies / Blockers (Definition of Ready)
- Updated-at and updated-by available in data layer.

## Assumptions
- This story covers display of existing audit metadata only.
- This story does not include adding or changing audit write logic.
- This story does not require audit metadata in views outside the listed phase-1 detail and list/table surfaces.
- The fallback placeholder applies independently per field; if one audit field exists and the other is missing, the available field still displays normally.

## Testable Outcomes
- Manual test: member, schedule-item, and money-record detail views show last updated at and last updated by when the data is present.
- Manual test: member-management tables, reminder or due-soon lists, and money summary tables show the required audit metadata when the data is present.
- Manual test: when either audit field is missing, the affected field shows `Not available` without breaking layout or hiding the other field.

## Open Questions for PO
- None for phase 1.

## Readiness Assessment
**Ready for Development**

Reason: the phase-1 in-scope detail views, in-scope list/table views, and the fallback rule for missing audit metadata are now explicitly defined, making the story bounded and testable.

## Sizing Note
Display only; do not add audit write logic here.
