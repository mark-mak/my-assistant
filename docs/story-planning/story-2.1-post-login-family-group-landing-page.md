# Story 2.1 — Post-login family group landing page

## Refined Description
Create a post-login landing page that lists the authenticated user’s available family groups and lets the user enter a selected group context.

## Acceptance Criteria (Definition of Done)
- After successful login, users who belong to one or more family groups are shown a landing page with their available family groups.
- The landing page shows only family groups the logged-in user is allowed to access.
- Users can select a family group from the list.
- After selection, the app enters that family-group-scoped context.

## Dependencies / Blockers (Definition of Ready)
- Story 1.1 available (authenticated session).
- Story 1.3 available (membership-based authorization checks).
- Group list data is available for the authenticated user.
- The target route/state that represents “entered group context” is identified.

## Assumptions
- Handling users with no family groups is out of scope for this story and covered by Story 2.3.
- Creating a new family group is out of scope for this story and covered by Story 2.2.

## Testable Outcomes
- Manual test: user with multiple groups sees their available groups after login.
- Manual test: selecting a group enters that selected group context.
- Manual test: user cannot enter a group they are not a member of from this landing flow.

## Readiness Assessment
**Ready for Development**

Reason: scope is bounded, acceptance criteria are testable, dependencies are identified, and no blocking product decisions are unresolved within this story’s scope.

## Sizing Note
Keep this story focused on listing and selecting an existing group only. Do not include create-group flow or no-group empty-state flow.
