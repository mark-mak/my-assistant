# Story 5.2 — Sort and filter persistence

## Description
Persist user-selected sort and filter state across browser refresh for the phase-1 in-scope date-driven views, while using the shared defaults from Story 5.1 as fallback behavior. In phase 1, persistence is browser-local on the current device and is stored independently per module/view rather than shared across modules.

## Acceptance Criteria (Definition of Done)
- The phase-1 in-scope views for this story are:
	- calendar/schedule views where sort and/or date filter controls are exposed
	- reminder or due-soon list views where sort and/or date filter controls are exposed
	- money summary view
- When a user changes sort and/or filter state in an in-scope view, refreshing that same view in the same browser reapplies the saved state.
- If no saved state exists for that view, the shared defaults from Story 5.1 are used.
- Persisted sort and filter state is browser-local only for phase 1 and is not required to follow the user across browsers, devices, or signed-in sessions on other devices.
- Sort and filter state persists independently per module/view; changing state in one in-scope view does not change the saved state of another in-scope view.
- Persistence behavior is implemented consistently across all in-scope views included in this story.

## Dependencies / Blockers (Definition of Ready)
- Story 5.1 available.

## Assumptions
- This story covers persistence across browser refresh only.
- This story does not define new sort or filter options; it only persists selections already supported by each in-scope module.
- This story follows the Story 5.1 in-scope module baseline and applies only to views within that scope that actually expose sort and/or filter controls.
- This story does not require cross-device sync, server-backed preference storage, or shared state between different modules.

## Testable Outcomes
- Manual test: after changing sort and/or filter state in an in-scope view, refreshing that same view in the same browser preserves those selections.
- Manual test: when no saved state exists, the view loads with the defaults defined in Story 5.1.
- Manual test: changing sort/filter state in one in-scope view does not change saved state in another in-scope view.
- Manual test: opening the same account in a different browser or device is not expected to reuse the saved sort/filter state from another browser/device in phase 1.
- Manual test: the same persistence behavior works consistently in each in-scope view covered by this story.

## Open Questions for PO
- None for phase 1.

## Readiness Assessment
**Ready for Development**

Reason: the phase-1 in-scope views, browser-local persistence model, and per-view state behavior are now explicitly defined, keeping the story aligned with Story 5.1 and making implementation and QA verification objective.

## Sizing Note
Keep to persistence only.
