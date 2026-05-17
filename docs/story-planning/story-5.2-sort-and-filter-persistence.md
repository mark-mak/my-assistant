# Story 5.2 — Sort and filter persistence

## Description
Persist user-selected sort and filter state across browser refresh for the defined in-scope modules, while using the shared PRD defaults as fallback behavior.

## Acceptance Criteria (Definition of Done)
- When a user changes sort and/or filter state in an in-scope module, refreshing the same view reapplies the saved state.
- If no saved state exists for that view, the shared defaults from Story 5.1 are used.
- Persistence behavior is implemented consistently across all in-scope modules included in this story.

## Dependencies / Blockers (Definition of Ready)
- Story 5.1 available.
- In-scope modules/views identified.
- Persistence model chosen.

## Assumptions
- This story covers persistence across browser refresh only.
- This story does not define new sort or filter options; it only persists selections already supported by each in-scope module.

## Testable Outcomes
- Manual test: after changing sort and/or filter state in an in-scope module, refreshing the same view preserves those selections.
- Manual test: when no saved state exists, the view loads with the defaults defined in Story 5.1.
- Manual test: the same persistence behavior works consistently in each in-scope module covered by this story.

## Open Questions for PO
- Which modules/views are in scope for this persistence behavior in phase 1?
- Is persisted state expected to be browser-local only, or tied to the authenticated user across devices/sessions?
- Should sort and filter state persist independently per module/view, or as one shared state across modules where controls overlap?

## Readiness Assessment
**Not Ready for Development**

Reason: the core behavior is clear, but the story is still missing the exact in-scope modules/views and the expected persistence scope, which are required to make implementation and QA verification objective.

## Sizing Note
Keep to persistence only.
