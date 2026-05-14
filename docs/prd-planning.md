# Product Requirements Document (PRD)

## 1. Document Information

- **Product**: my-assistant
- **Document type**: Product Requirements Document
- **Version**: v0.2
- **Status**: Draft for review

## 2. Purpose and Scope

This PRD defines the phase-1 product requirements for authentication, permission control, family group management, member handling, controlled values, calendar and reminders, money summary behavior, default sorting/filter behavior, mobile navigation, audit metadata, and session scope.

This document focuses on **product behavior**. Technical implementation details (for example, enum library vs custom enum type) are intentionally excluded unless they affect user-facing outcomes.

## 3. Goals

1. Standardize core data behavior and defaults across modules.
2. Provide consistent calendar/reminder handling with clear boundaries.
3. Ensure user-visible consistency for filtering, sorting, summaries, and metadata.
4. Establish clear phase-1 scope and unresolved decisions before implementation.
5. Enforce authentication and permission boundaries at the family group level.

## 4. Out of Scope (Phase 1)

- Recurring reminder behavior.
- Session-level tracking beyond selected family member.
- Technical framework decisions that do not change product behavior.

## 5. Functional Requirements

### FR-1 Authentication and Login

1. The system must require users to **log in** before accessing any application content.
2. Unauthenticated users must be redirected to a **login page**.
3. The login page must be the entry point of the application for unauthenticated users.
4. Authentication mechanism details (for example, OAuth, email/password, SSO) are a technical design decision and are not a PRD blocker.

### FR-2 Permission Control

1. All application data and features must be accessible only to **authenticated users**.
2. A user must only be able to view and interact with family groups they **belong to**.
3. Data of one family group must not be accessible to users outside that group.

### FR-3 Family Group Management

1. After login, a user must be presented with their **family group(s)**.
2. A user must be able to **create a new family group**.
3. A user must be able to **select a family group** to enter and interact with its data.
4. A family group must have **at least one member** at all times.
5. The system must **prevent removal of the last remaining member** of a family group.
   - The UI must communicate clearly why the removal is blocked when this constraint is triggered.
6. Open Question: behavior when a user belongs to no family groups is tracked in Open Question #7.

### FR-4 Member Management

1. The system must support member deletion through **soft delete**.
2. Historical records must continue displaying references to soft-deleted members.
3. The product must define visibility behavior for soft-deleted members across:
   - display contexts (where they remain visible)
   - active selection contexts (where they are excluded)

### FR-5 Controlled Values (Enums)

The system must use controlled values for the following fields:

1. **Currency**
   - Allowed value in phase 1: HKD
   - Default value: **HKD**
2. **Priority**
   - Highest, High, Medium, Low, Lowest
3. **Status**
   - Draft, Ready, Done
4. **Money spent category**
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

Note: Use of a third-party enum library versus a custom enum approach is a technical design decision and is not a PRD blocker.

### FR-6 Calendar / Schedule

1. The calendar must support **month view**.
2. The schedule must allow **overlapping schedule items**.
3. The system must support **simple recurring events**.
4. Each recurring event must include:
   - interval
   - start date
   - end date
5. Supported recurrence examples must be explicitly represented in product behavior:
   - daily recurrence
   - weekday-based recurrence
   - weekly recurrence
6. Recurrence range must be limited to a maximum of **1 year**.
7. Default timezone must be **HKT (UTC+8)**.

### FR-7 Reminder / Due Soon

1. "Due soon" status must be derived from each item's configured **reminder offset**.
2. When reminders are enabled, users must be able to select reminder timing options (for example: 2 days before, 1 week before).
3. Reminder behavior in this phase must be **non-recurring**.
4. Reminder and due-soon behavior must apply consistently across **all in-scope modules**.

### FR-8 Money Summary

1. Default filter must be **current month**.
2. Default grouping must be **category**.
3. When no records match the active filters, the UI must show an empty-state message.
4. Table totals and chart totals must always match the currently active filters.

### FR-9 Default Sorting and Filter Persistence

1. Default sorting must be **date descending** (most recent first).
2. Default filter must be **this month**.
3. After refresh, the user must see the same default sorting/filter behavior.

### FR-10 Mobile Navigation

1. Mobile web must include a **side menu**.
2. Exact trigger behavior is pending and tracked in Open Question #6.

### FR-11 Audit Metadata

The system must display:

- **last updated at**
- **last updated by**

for both:

1. detail views
2. list/table views

### FR-12 Session Scope

Phase 1 session tracking is limited to **selected family member** only.

No additional session-level tracking is required.

## 6. Defaults and Global Rules

1. **Timezone default**: HKT (UTC+8)
2. **Date sorting default**: descending
3. **Date filter default**: current month / this month
4. **Money summary grouping default**: category
5. **Currency default**: HKD

## 7. Acceptance Criteria (Phase 1)

1. Product behaviors in FR-1 to FR-12 are implemented and testable at UI level.
2. Unauthenticated users are redirected to the login page and cannot access any app content.
3. Users can only access family groups they belong to.
4. A family group cannot be left with zero members; the last member removal is blocked with a clear UI message.
5. Default behaviors are applied consistently after page refresh.
6. Money summary totals are consistent between table and chart for identical filters.
7. Historical records continue to resolve deleted member references.
8. Audit metadata appears in both detail and list/table views.
9. Recurrence is bounded to 1 year and uses HKT as default timezone.

## 8. Open Questions / Clarifications Required

1. **Soft-deleted member visibility**
   - Exact list of screens/components where soft-deleted members remain visible.
   - Exact selection controls where soft-deleted members are excluded.

2. **Recurrence options**
   - Final allowed recurrence patterns for phase 1 (exact set and labels).

3. **Reminder offset options**
   - Final list of reminder choices (for example, 1 day, 2 days, 1 week).

4. **"Others with mentions" for Money spent category "Others" (stakeholder term)**
   - Clarify whether entries using the Money spent "Others" category support free-text mention, tagging, or predefined sub-values.

5. **Sort/filter persistence model**
   - Confirm whether persistence is local-only (client/device) or server-backed (account-level).

6. **Mobile side-menu trigger**
   - Confirm exact trigger interaction(s): icon tap, swipe gesture, or both.

7. **No family group state**
   - Define the user experience when an authenticated user belongs to no family groups: should the app auto-prompt group creation, show an empty state, or redirect to an onboarding flow?

## 9. Risks and Dependencies

1. Unresolved open questions may delay implementation or create inconsistent module behavior.
2. Cross-module reminder behavior requires consistent domain definitions across all feature modules.
3. Audit metadata display depends on reliable availability of updated-at / updated-by data in all relevant records.
4. Authentication implementation must be in place before any family group or data access features can be tested end-to-end.
