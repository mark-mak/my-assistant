# Story 8.2 — Money summary total consistency

## Description
Ensure the money summary table totals and chart totals use the same active filters and aggregation basis so both views present consistent totals. In phase 1, this consistency applies to the category-grouped money summary for family-group-scoped money/spending records only.

## Acceptance Criteria (Definition of Done)
- For the same active filters, the money summary table totals match the corresponding chart totals for the same filtered set of family-group money/spending records.
- When a user changes filters in the money summary view, both table totals and chart totals update to the same filtered result.
- The required matching aggregation basis in phase 1 is category-grouped subtotal amounts plus the overall grand total for the currently filtered record set.
- The table and chart both derive their displayed totals from the same underlying filtered records and the same category-grouped aggregation result.
- If amount precision could create a display mismatch, the source of truth is the shared aggregated monetary value before display formatting, and both table and chart must present that result using the same currency display precision.
- In phase 1, money summary totals are displayed using standard currency formatting to 2 decimal places consistently across both representations.

## Dependencies / Blockers (Definition of Ready)
- Story 8.1 available.

## Assumptions
- This story covers totals consistency between existing money summary representations only.
- This story does not add new filters, new summary visualizations, or persistence behavior.
- This story assumes the phase-1 default grouping from Story 8.1 remains category.
- This story does not require subtotal parity for groupings or drill-down views that are not part of the phase-1 money summary.

## Testable Outcomes
- Automated test: for the same filtered data set, each category subtotal and the overall grand total are equal between the chart and table.
- Manual test: changing filters updates both chart totals and table totals to the same result.
- Manual test: an empty or zero-result filtered state shows consistent zero/empty totals behavior across both representations.
- Manual test: totals that include decimal amounts display the same 2-decimal currency result in the chart and table.

## Open Questions for PO
- None for phase 1.

## Readiness Assessment
**Ready for Development**

Reason: the phase-1 aggregation basis and the rounding/display source-of-truth rule are now explicitly defined, keeping the story aligned with the approved money-summary scope, defaults, and PRD consistency requirement so implementation and QA can verify matching totals objectively.

## Sizing Note
Keep to aggregation consistency only.
