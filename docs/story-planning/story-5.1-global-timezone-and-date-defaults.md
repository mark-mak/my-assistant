# Story 5.1 — Global timezone and date defaults

## Refined Description
Define and apply shared default behavior for timezone, date sorting, and date filtering across the phase-1 date-driven modules so default date-based views behave consistently. In phase 1, this story applies to calendar/schedule views, reminder or due-soon list views where date filtering or sorting is exposed, and the money summary view.

## Acceptance Criteria (Definition of Done)
- HKT (UTC+8) is applied as the default timezone for date-based default calculations in each in-scope module.
- The phase-1 in-scope modules for this story are:
	- calendar/schedule views
	- reminder or due-soon list views for in-scope items where date filtering or sorting is supported
	- money summary view
- Default sort is date descending in each in-scope module where date sorting is supported.
- Default filter is current month in each in-scope module where date filtering is supported.
- The default date field used for each in-scope module is:
	- calendar/schedule views: event start date/time
	- reminder or due-soon list views: item due date/time
	- money summary view: record transaction/spend date
- The same default behavior is applied consistently across all in-scope modules listed for this story.
- Auth/access flows, family-group entry and management flows, member-management flows, audit-metadata display views, and controlled-value definition work are out of scope for Story 5.1.

## Dependencies / Blockers (Definition of Ready)
- Shared date utilities or config approach available.

## Assumptions
- This story covers default behavior only and excludes persistence (handled separately in Story 5.2).
- The defaults defined here are the fallback defaults when no saved user state is applied.
- For calendar month view, current month is based on the event start date/time under the HKT default timezone.
- For reminder or due-soon views, default date behavior is based on the item's due date/time rather than reminder trigger time.
- For money summary, default month filtering is based on the transaction/spend date associated with the record.

## Testable Outcomes
- Manual test: calendar/schedule views default to the current HKT month using event start date/time.
- Manual test: reminder or due-soon list views default to current-month filtering and date-descending sorting based on item due date/time where those controls exist.
- Manual test: money summary defaults to current-month filtering based on transaction/spend date, with date-descending sorting where sorting is supported.
- Automated test: shared default configuration resolves to HKT, current-month, and date-descending behavior.

## Open Questions for PO
- None for phase 1.

## Readiness Assessment
**Ready for Development**

Reason: the phase-1 in-scope modules and the default date field for each module are now explicitly defined, keeping the story aligned with the PRD and ready for implementation and QA.

## Sizing Note
Do not include persistence in this story.
