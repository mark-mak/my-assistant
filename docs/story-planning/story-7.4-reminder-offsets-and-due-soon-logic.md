# Story 7.4 — Reminder offsets and due-soon logic

## Description
Implement phase-1 non-recurring reminder timing options and due-soon status derivation for the defined in-scope schedule items. In phase 1, this story applies to one-off family-group-scoped schedule items and recurring schedule items created under Story 7.3, without adding actual notification delivery.

## Acceptance Criteria (Definition of Done)
- The phase-1 allowed reminder offset options are: 1 day before, 2 days before, and 1 week before.
- Users can select a reminder timing from those allowed offset options for in-scope schedule items.
- The phase-1 in-scope item types for this story are:
	- one-off family-group-scoped schedule items
	- recurring schedule items supported by Story 7.3
- Due-soon status is derived consistently from the selected reminder offset using this rule: an item becomes due soon when the current date/time reaches or passes the scheduled date/time minus the selected reminder offset, and remains due soon until the scheduled date/time passes.
- If no reminder offset is selected, the item is not treated as due soon by this story.
- Reminder behavior in this story is limited to non-recurring reminders.
- The same allowed offset options and due-soon rule are applied consistently across all in-scope item types in phase 1.

## Dependencies / Blockers (Definition of Ready)
- Story 7.1 available.
- Story 7.3 available for recurring schedule items.

## Assumptions
- This story covers reminder offset selection and due-soon status derivation only.
- Reminder offset selection is available only for schedule items in the defined phase-1 scope.
- This story does not include recurring reminders or notification delivery unless separately brought into scope.

## Testable Outcomes
- Automated test: due-soon status changes according to the selected offset rule for one-off and recurring schedule items in scope.
- Manual test: the allowed reminder offset options are available for each in-scope schedule item type covered by this story.
- Manual test: selecting and saving a reminder offset preserves the expected non-recurring reminder behavior.
- Manual test: an item with no selected reminder offset is not treated as due soon by this story.

## Open Questions for PO
- None for phase 1.

## Readiness Assessment
**Ready for Development**

Reason: the phase-1 reminder offset options, the due-soon derivation rule, and the in-scope schedule item types are now explicitly defined, keeping the story aligned with the completed calendar stories and making implementation and QA verification objective.

## Sizing Note
Do not include actual notification delivery unless already in scope.
