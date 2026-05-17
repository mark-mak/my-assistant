# Story 7.4 — Reminder offsets and due-soon logic

## Description
Implement phase-1 non-recurring reminder timing options and due-soon status derivation for the defined in-scope schedule items.

## Acceptance Criteria (Definition of Done)
- Users can select a reminder timing from the agreed allowed offset options for in-scope schedule items.
- Due-soon status is derived consistently from the selected reminder offset using the agreed business rule.
- Reminder behavior in this story is limited to non-recurring reminders.

## Dependencies / Blockers (Definition of Ready)
- Reminder offset options finalized.
- In-scope modules identified.

## Assumptions
- This story covers reminder offset selection and due-soon status derivation only.
- This story does not include recurring reminders or notification delivery unless separately brought into scope.

## Testable Outcomes
- Automated test: due-soon status changes according to the agreed reminder offset rule.
- Manual test: the allowed reminder offset options are available for each in-scope module or item type covered by this story.
- Manual test: selecting and saving a reminder offset preserves the expected non-recurring reminder behavior.

## Open Questions for PO
- What are the exact allowed reminder offset options for phase 1?
- What is the exact rule for when an item is considered due soon based on the selected reminder offset?
- Which schedule item types or modules are in scope for reminder offsets and due-soon behavior?

## Readiness Assessment
**Not Ready for Development**

Reason: the story objective is clear, but the allowed reminder offsets, the due-soon derivation rule, and the exact in-scope modules/item types are still undefined, so implementation and QA cannot verify the behavior objectively.

## Sizing Note
Do not include actual notification delivery unless already in scope.
