# PRD Planning

This document consolidates the currently confirmed product requirements and the remaining clarification items before turning them into a formal PRD.

## Confirmed Requirements

### 1. Member Management

- Members can be deleted through a **soft delete** approach.
- Historical records must continue displaying references to deleted members.
- The PRD must define where deleted members remain visible and where they are excluded from active selection lists.

### 2. Enums / Controlled Values

The product should use controlled values for the following:

- **Currency**
  - Default currency: **HKD**
- **Priority**
  - Highest
  - High
  - Medium
  - Low
  - Lowest
- **Status**
  - Draft
  - Ready
  - Done
- **Money spent category**
  - Dining
  - Entertainment
  - Shopping
  - Travel
  - Transportation
  - Household
  - Personal Care
  - Fixed Payment
  - Medical and Health
  - Personal Development
  - Others

Whether these are implemented with a library or custom enums is a technical design decision and should not block the PRD.

### 3. Calendar / Schedule

- Support a **month view** for the calendar.
- Schedule items can **overlap**.
- Support **simple recurring events**.
- Recurring events must include:
  - recurrence interval
  - start date
  - end date
- Supported recurrence patterns should be explicitly listed in the PRD, such as:
  - by day
  - by weekday
  - by week
- Maximum recurrence range: **1 year**
- Default timezone: **HKT (UTC+8)**

### 4. Reminder / Due Soon

- “Due soon” should be driven by the configured **reminder offset**.
- When reminder is enabled, users can choose reminder timing such as:
  - two days before
  - one week before
- No recurring reminder behavior is required in this phase.
- Reminder support applies across **all modules** in scope.

### 5. Money Summary

- Default filter: **current month**
- If no records exist for the active filter, show an **empty-state message**
- Default grouping: **category**
- Table totals and chart totals must always match the currently active filters

### 6. Default Sorting and Filter Persistence

- Default sorting: **date descending** (most recent first)
- Default filter: **this month**
- After refresh, the product should show the same default sorting and filtering behavior

### 7. Mobile Navigation

- Add a **side menu** for the mobile web experience
- The PRD should define how the side menu is triggered to show

### 8. Audit Metadata

Display the following on both:

- detail views
- list/table views

Required audit fields:

- **last updated at**
- **last updated by**

### 9. Session Scope

- There is no need for session-level tracking in this phase beyond **selected family member**

## Open Clarification Items

The following items should be resolved in the PRD before implementation begins:

1. **Soft-deleted member visibility**
   - Where should deleted members still appear?
   - Where should deleted members be hidden from selection?

2. **Recurrence options**
   - What exact recurrence patterns are allowed in the first version?

3. **Reminder offset options**
   - What exact reminder choices should be available to users?

4. **“Others with mentions” meaning**
   - Does “Others” allow free-text notes, tags, or structured sub-labels?

5. **Sort/filter persistence behavior**
   - Should persistence be local-only or stored server-side?

6. **Mobile side-menu trigger**
   - Should it open from a menu icon, gesture, or another explicit trigger?

## Notes for PRD Drafting

- Treat the items above as confirmed input for PRD drafting rather than implementation-ready technical specifications.
- Keep technical implementation choices separate from product requirements unless they materially affect user behavior.
