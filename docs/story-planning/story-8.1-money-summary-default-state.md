# Story 8.1 — Money summary default state

## Description
Implement the default state for the money summary view so it loads with the agreed filter and grouping behavior before the user makes any changes. In phase 1, the money summary view is based on family-group-scoped money/spending records only.

## Acceptance Criteria (Definition of Done)
- On initial load, the money summary view defaults to the current month filter.
- On initial load, the money summary view defaults to category grouping.
- The phase-1 money summary data source is the family group's money/spending records, using the transaction/spend date defined in Story 5.1 for default month filtering.
- If no records match the default filter, the view shows an empty-state message explaining that there are no money records for the current month.
- The empty state keeps the money summary view structure visible and does not present this as an error.
- The empty state does not introduce create-record flows, onboarding flows, or alternate reporting views within this story.

## Dependencies / Blockers (Definition of Ready)
- Story 5.1 available.

## Assumptions
- This story covers default state behavior only.
- This story does not include persistence, aggregation consistency validation, or expanded filtering behavior beyond the defined defaults.
- Phase 1 money summary scope is limited to money/spending records and does not include non-money household activity, reminders, or calendar items.

## Testable Outcomes
- Manual test: opening the money summary view for the first time loads the current month filter and category grouping by default.
- Manual test: when no money/spending records match the default current-month filter, the money summary view shows the empty-state message without rendering failure.
- Manual test: the empty state remains within the money summary view rather than redirecting the user elsewhere.

## Open Questions for PO
- None for phase 1.

## Readiness Assessment
**Ready for Development**

Reason: the phase-1 money-summary data source and the default-state empty-state behavior are now explicitly defined, keeping the story aligned with the approved default and persistence behavior and making implementation and QA objective.

## Sizing Note
Do not include chart/table consistency validation logic here.
