# Story Planning

This document breaks the updated PRD into small, testable implementation stories for a high-agency development team.

## Planning Principles

Each story should be:
- small enough to complete in a short iteration
- independently testable
- clear in scope
- explicit about dependencies and blockers
- written with acceptance criteria as the definition of done

## Epic 1 — Authentication and Access Control

### Story 1.1 — Login page and authenticated session
**Description**
Implement a login page and authenticated session flow so users must sign in before accessing protected product features.

**Acceptance Criteria (Definition of Done)**
- Unauthenticated users are redirected to the login page when trying to access protected content.
- Users can log in successfully.
- Authenticated session persists across refresh until logout or expiry.
- Users can log out successfully.

**Dependencies / Blockers (Definition of Ready)**
- Authentication approach/provider selected.
- Protected route list identified.

**Testable Outcomes**
- Manual test: signed-out user cannot access protected page.
- Manual test: successful login lands user in post-login flow.
- Manual test: logout returns user to login.

**Sizing Note**
Keep to basic login/session behavior only. Do not include permissions or family-group selection in this story.

### Story 1.2 — Protected route wrapper
**Description**
Add a shared route guard or protected layout so authenticated access is enforced consistently across the application.

**Acceptance Criteria (Definition of Done)**
- All protected routes require authentication.
- Public routes remain accessible without authentication.
- Direct navigation to protected URLs while signed out redirects to login.

**Dependencies / Blockers (Definition of Ready)**
- Story 1.1 available.
- Route structure is known.

**Testable Outcomes**
- Manual test: protected routes redirect when signed out.
- Manual test: protected routes render normally when signed in.

**Sizing Note**
Limit to route protection behavior only.

### Story 1.3 — Membership-based authorization checks
**Description**
Implement authorization checks so users can only access family groups they belong to.

**Acceptance Criteria (Definition of Done)**
- Users can access only their own family-group-scoped data.
- Direct navigation to a non-member family group is blocked.
- Unauthorized access is handled consistently.

**Dependencies / Blockers (Definition of Ready)**
- Story 1.1 available.
- Family group membership data model defined.

**Testable Outcomes**
- Manual test: user cannot access another group by URL manipulation.
- Automated test: authorization check fails for non-member access.

**Sizing Note**
Focus on guard/check logic, not group selection UI.

## Epic 2 — Family Group Entry Experience

### Story 2.1 — Post-login family group landing page
**Description**
Create a post-login landing page that shows the user’s available family groups and allows selection.

**Acceptance Criteria (Definition of Done)**
- After login, the user sees their family groups.
- Users with multiple groups can choose one.
- Selecting a group enters that scoped context.

**Dependencies / Blockers (Definition of Ready)**
- Stories 1.1 and 1.3 available.
- Group list data available.

**Testable Outcomes**
- Manual test: multi-group user can choose a group.
- Manual test: selected group is reflected in entered context.

**Sizing Note**
Do not include create-group flow here.

### Story 2.2 — Create family group flow
**Description**
Allow a logged-in user to create a new family group from the post-login experience.

**Acceptance Criteria (Definition of Done)**
- User can create a family group.
- Creator becomes the first member automatically.
- User is routed into the created family group after success.

**Dependencies / Blockers (Definition of Ready)**
- Story 2.1 available.
- Group creation API/data path available.

**Testable Outcomes**
- Manual test: creating a family group succeeds.
- Automated test: created group includes creator as member.

**Sizing Note**
Do not include invitations or join-by-code in this story.

### Story 2.3 — No-family-group empty state
**Description**
Create an empty state for users who log in and do not belong to any family group.

**Acceptance Criteria (Definition of Done)**
- Users with no groups see a clear empty state.
- Empty state includes a clear create-family-group call to action.
- User is not blocked or stranded after login.

**Dependencies / Blockers (Definition of Ready)**
- Story 2.1 available.
- Product decision confirmed for phase-1 empty-state behavior.

**Testable Outcomes**
- Manual test: user with no groups sees correct empty state.
- Manual test: CTA leads into create-group flow.

**Sizing Note**
Keep to empty-state UX only.

## Epic 3 — Family Membership Guardrails

### Story 3.1 — Prevent removing the last family member
**Description**
Enforce the rule that a family group must always have at least one active member.

**Acceptance Criteria (Definition of Done)**
- System blocks removal of the last active member.
- System blocks soft deletion of the last active member.
- Clear error/feedback is returned for blocked actions.

**Dependencies / Blockers (Definition of Ready)**
- Membership model defined.
- Removal and soft-delete paths identified.

**Testable Outcomes**
- Automated test: removing last member fails.
- Manual test: blocked action shows clear message.

**Sizing Note**
This story is about rule enforcement only, not the full removal UX.

### Story 3.2 — Member removal UX and messaging
**Description**
Add confirmation and explanatory messaging for member removal, including blocked last-member cases.

**Acceptance Criteria (Definition of Done)**
- Removal action shows confirmation where appropriate.
- Blocked last-member removal is clearly explained.
- Normal removal works when more than one member exists.

**Dependencies / Blockers (Definition of Ready)**
- Story 3.1 available.
- Removal UI location identified.

**Testable Outcomes**
- Manual test: member removal confirmation appears.
- Manual test: blocked last-member case is understandable.

**Sizing Note**
UI/UX only. Do not duplicate server rule logic here.

## Epic 4 — Member Management

### Story 4.1 — Soft delete member
**Description**
Implement soft delete behavior for members while preserving historical references.

**Acceptance Criteria (Definition of Done)**
- Member can be soft deleted.
- Historical records continue to show deleted member references.
- Soft-deleted members are excluded from active selectors.

**Dependencies / Blockers (Definition of Ready)**
- Story 3.1 available.
- Historical reference behavior agreed.

**Testable Outcomes**
- Automated test: deleted member still appears in historical record rendering.
- Manual test: deleted member does not appear in active selector.

**Sizing Note**
Focus on member deletion behavior only.

### Story 4.2 — Soft-deleted member visibility matrix
**Description**
Define and implement where soft-deleted members remain visible versus hidden.

**Acceptance Criteria (Definition of Done)**
- Display contexts and selection contexts are explicitly listed.
- Implemented views follow the visibility rules consistently.

**Dependencies / Blockers (Definition of Ready)**
- Product clarification on visibility contexts.
- Story 4.1 available.

**Testable Outcomes**
- Manual test: deleted members appear only in approved contexts.
- Review artifact: visibility matrix documented.

**Sizing Note**
Keep to visibility rules only.

## Epic 5 — Shared Defaults and Metadata

### Story 5.1 — Global timezone and date defaults
**Description**
Apply shared defaults for timezone, date sorting, and date filtering across in-scope modules.

**Acceptance Criteria (Definition of Done)**
- HKT (UTC+8) is the default timezone.
- Default sort is date descending.
- Default filter is current month.

**Dependencies / Blockers (Definition of Ready)**
- Target modules identified.
- Shared date utilities or config approach available.

**Testable Outcomes**
- Manual test: default views show current month and descending date order.
- Automated test: shared defaults resolve correctly.

**Sizing Note**
Do not include persistence in this story.

### Story 5.2 — Sort and filter persistence
**Description**
Persist sort and filter state across refresh while preserving PRD defaults as fallback behavior.

**Acceptance Criteria (Definition of Done)**
- Refresh preserves expected sort/filter state.
- If no saved state exists, PRD defaults are used.
- Persistence behavior is consistent in all in-scope modules.

**Dependencies / Blockers (Definition of Ready)**
- Story 5.1 available.
- Persistence model chosen.

**Testable Outcomes**
- Manual test: selected sort/filter persists after refresh.
- Manual test: new/cleared state falls back to defaults.

**Sizing Note**
Keep to persistence only.

### Story 5.3 — Audit metadata display
**Description**
Display last updated at and last updated by in detail and list/table views.

**Acceptance Criteria (Definition of Done)**
- Audit metadata appears in required detail views.
- Audit metadata appears in required list/table views.
- Missing metadata is handled gracefully if needed.

**Dependencies / Blockers (Definition of Ready)**
- Updated-at and updated-by available in data layer.
- Target screens identified.

**Testable Outcomes**
- Manual test: detail view shows audit metadata.
- Manual test: list/table view shows audit metadata.

**Sizing Note**
Display only; do not add audit write logic here.

## Epic 6 — Controlled Values

### Story 6.1 — Shared controlled values definitions
**Description**
Define and expose shared controlled values for currency, priority, status, and money spent category.

**Acceptance Criteria (Definition of Done)**
- Allowed values are centralized.
- HKD is the default and only currency in phase 1.
- Consumers use the shared definitions consistently.

**Dependencies / Blockers (Definition of Ready)**
- PRD values finalized.

**Testable Outcomes**
- Automated test: invalid values are rejected.
- Manual test: forms show the expected options.

**Sizing Note**
Do not include feature-specific form wiring beyond verifying integration points.

## Epic 7 — Calendar and Reminders

### Story 7.1 — Calendar month view
**Description**
Implement month-view calendar rendering for family-group-scoped schedule items.

**Acceptance Criteria (Definition of Done)**
- Calendar displays in month view.
- Schedule items render in the correct dates.
- Default timezone behavior follows HKT.

**Dependencies / Blockers (Definition of Ready)**
- Story 1.3 available.
- Calendar data available.

**Testable Outcomes**
- Manual test: month calendar renders expected events.
- Manual test: date placement follows timezone rules.

**Sizing Note**
Month view only.

### Story 7.2 — Overlapping schedule items
**Description**
Support overlapping schedule items without data loss or rendering failure.

**Acceptance Criteria (Definition of Done)**
- Multiple overlapping items can be created or displayed.
- Overlapping items remain understandable in UI.

**Dependencies / Blockers (Definition of Ready)**
- Story 7.1 available.
- Overlap rendering approach chosen.

**Testable Outcomes**
- Manual test: overlapping items display correctly.
- Automated test: overlap data is preserved.

**Sizing Note**
Do not include recurrence here.

### Story 7.3 — Simple recurring events
**Description**
Support simple recurrence with interval, start date, end date, and bounded range.

**Acceptance Criteria (Definition of Done)**
- Daily, weekday-based, and weekly recurrence are supported.
- Recurrence includes interval, start date, and end date.
- Recurrence range cannot exceed one year.

**Dependencies / Blockers (Definition of Ready)**
- Final recurrence options confirmed.
- Story 7.1 available.

**Testable Outcomes**
- Automated test: recurrence generation respects pattern and one-year cap.
- Manual test: recurring items appear correctly in calendar.

**Sizing Note**
Keep to phase-1 recurrence only.

### Story 7.4 — Reminder offsets and due-soon logic
**Description**
Implement non-recurring reminder timing options and due-soon status derivation.

**Acceptance Criteria (Definition of Done)**
- Reminder timing can be selected from allowed options.
- Due-soon status is derived from reminder offset.
- Reminder behavior is non-recurring.

**Dependencies / Blockers (Definition of Ready)**
- Reminder offset options finalized.
- In-scope modules identified.

**Testable Outcomes**
- Automated test: due-soon status changes correctly by offset.
- Manual test: reminder options are available and saved.

**Sizing Note**
Do not include actual notification delivery unless already in scope.

## Epic 8 — Money Summary

### Story 8.1 — Money summary default state
**Description**
Implement the default money summary filter and grouping behavior.

**Acceptance Criteria (Definition of Done)**
- Default filter is current month.
- Default grouping is category.
- Empty state is shown when no records match.

**Dependencies / Blockers (Definition of Ready)**
- Story 5.1 available.
- Money summary view exists or is planned.

**Testable Outcomes**
- Manual test: summary loads with current month and category grouping.
- Manual test: empty state appears with no matching records.

**Sizing Note**
Do not include chart/table consistency validation logic here.

### Story 8.2 — Money summary total consistency
**Description**
Ensure table totals and chart totals always match active filters.

**Acceptance Criteria (Definition of Done)**
- Table totals match chart totals for the same filters.
- Totals update correctly when filters change.

**Dependencies / Blockers (Definition of Ready)**
- Story 8.1 available.
- Shared aggregation logic identified.

**Testable Outcomes**
- Automated test: chart and table totals match.
- Manual test: changing filters updates both consistently.

**Sizing Note**
Keep to aggregation consistency only.

## Epic 9 — Mobile Navigation

### Story 9.1 — Mobile side menu shell
**Description**
Implement a mobile side menu for navigation.

**Acceptance Criteria (Definition of Done)**
- Mobile layout includes a side menu.
- Menu opens and closes reliably.
- Menu contains required primary navigation items.

**Dependencies / Blockers (Definition of Ready)**
- Mobile navigation destinations identified.
- Trigger interaction decision available or default selected.

**Testable Outcomes**
- Manual test: side menu opens/closes on mobile viewport.
- Manual test: menu navigation works.

**Sizing Note**
Implement shell behavior first; keep advanced gesture work separate if needed.

## Suggested Delivery Sequence
1. Story 1.1
2. Story 1.2
3. Story 1.3
4. Story 2.1
5. Story 2.3
6. Story 2.2
7. Story 3.1
8. Story 3.2
9. Story 4.1
10. Story 4.2
11. Story 5.1
12. Story 5.2
13. Story 5.3
14. Story 6.1
15. Story 7.1
16. Story 7.2
17. Story 7.3
18. Story 7.4
19. Story 8.1
20. Story 8.2
21. Story 9.1

## Notes for the Team
- Keep stories vertically sliced where possible.
- Enforce the minimum-one-member rule in backend/domain logic, not UI only.
- Resolve open product questions early where they block implementation.
- Prefer explicit test cases per story before starting implementation.
