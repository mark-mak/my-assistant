# Story 8.1 — Money summary default state

## Description
Implement the default state for the money summary view so it loads with the agreed filter and grouping behavior before the user makes any changes.

## Acceptance Criteria (Definition of Done)
- On initial load, the money summary view defaults to the current month filter.
- On initial load, the money summary view defaults to category grouping.
- If no records match the default filter, the view shows the agreed empty state.

## Dependencies / Blockers (Definition of Ready)
- Story 5.1 available.
- Money summary view and in-scope data source identified.

## Assumptions
- This story covers default state behavior only.
- This story does not include persistence, aggregation consistency validation, or expanded filtering behavior beyond the defined defaults.

## Testable Outcomes
- Manual test: opening the money summary view for the first time loads the current month filter and category grouping by default.
- Manual test: when no records match the default filter, the money summary view shows the agreed empty state.

## Open Questions for PO
- What is the expected empty-state content when no records match the default filter?
- Which data set or record types are included in the phase-1 money summary view?

## Readiness Assessment
**Not Ready for Development**

Reason: the default filter and grouping are clear, but the exact empty-state behavior and the in-scope money summary data source still need clarification for implementation and QA to be objective.

## Sizing Note
Do not include chart/table consistency validation logic here.
