# Story 8.2 — Money summary total consistency

## Description
Ensure the money summary table totals and chart totals use the same active filters and aggregation basis so both views present consistent totals.

## Acceptance Criteria (Definition of Done)
- For the same active filters, the money summary table totals match the corresponding chart totals.
- When a user changes filters in the money summary view, both table totals and chart totals update to the same filtered result.
- Totals are calculated consistently using the agreed shared aggregation logic for all in-scope summary data.

## Dependencies / Blockers (Definition of Ready)
- Story 8.1 available.
- Shared aggregation logic identified.

## Assumptions
- This story covers totals consistency between existing money summary representations only.
- This story does not add new filters, new summary visualizations, or persistence behavior.

## Testable Outcomes
- Automated test: for the same filtered data set, chart totals and table totals are equal.
- Manual test: changing filters updates both chart totals and table totals to the same result.
- Manual test: an empty or zero-result filtered state shows consistent totals across both representations.

## Open Questions for PO
- What is the exact aggregation basis that must match between the table and chart: total amount only, or also category/subtotal breakdowns?
- What rounding or display rule should be treated as the source of truth if the chart and table present totals at different precision levels?

## Readiness Assessment
**Not Ready for Development**

Reason: the consistency goal is clear, but the exact aggregation scope and display/rounding rule still need clarification so implementation and QA can verify matching totals objectively.

## Sizing Note
Keep to aggregation consistency only.
