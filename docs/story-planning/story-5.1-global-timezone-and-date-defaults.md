# Story 5.1 — Global timezone and date defaults

## Refined Description
Define and apply shared default behavior for timezone, date sorting, and date filtering across agreed in-scope modules so default date-based views behave consistently.

## Acceptance Criteria (Definition of Done)
- HKT (UTC+8) is applied as the default timezone for date-based default calculations in each in-scope module.
- Default sort is date descending in each in-scope module where date sorting is supported.
- Default filter is current month in each in-scope module where date filtering is supported.
- The same default behavior is applied consistently across all in-scope modules listed for this story.

## Dependencies / Blockers (Definition of Ready)
- Target modules are explicitly identified and agreed.
- Shared date utilities or config approach available.
- Default date field(s) used for sort/filter in each in-scope module are confirmed.

## Assumptions
- This story covers default behavior only and excludes persistence (handled separately in Story 5.2).
- The defaults defined here are the fallback defaults when no saved user state is applied.

## Testable Outcomes
- Manual test: in each in-scope module, first-load/default view uses HKT (UTC+8), current-month filter, and date-descending sort where supported.
- Automated test: shared default configuration resolves to HKT, current-month, and date-descending behavior.

## Open Questions for PO
- Which exact modules are in scope for Story 5.1 in phase 1?
- For each in-scope module, which date field should be used for default sorting and current-month filtering when multiple date fields exist?

## Readiness Assessment
**Not Ready for Development**

Reason: in-scope module list and per-module default date field decisions are not yet explicitly confirmed.

## Sizing Note
Do not include persistence in this story.
