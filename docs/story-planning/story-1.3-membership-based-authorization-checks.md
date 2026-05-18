# Story 1.3 — Membership-based authorization checks

## Refined Description
Implement membership-based authorization checks so authenticated users can only access data and routes for family groups they are members of. In phase 1, non-member access attempts are blocked and the user is returned to the standard post-login family-group entry experience with a clear access-denied message.

## Acceptance Criteria (Definition of Done)
- For family-group-scoped requests, access is granted only when the authenticated user is a member of the target family group.
- For family-group-scoped requests, access is denied when the authenticated user is not a member of the target family group.
- Direct navigation to another family group's URL does not expose that group's data.
- When an authenticated non-member attempts to access a family-group-scoped route, the app does not render the target group's data and returns the user to the post-login family-group entry experience.
- The denied access flow shows a clear user-facing message that the user does not have access to that family group.
- Unauthorized access is handled using this same user-facing behavior consistently across in-scope family-group routes.

## Dependencies / Blockers (Definition of Ready)
- Story 1.1 available (authenticated session).
- Story 1.2 available (protected route enforcement).
- Family group membership data model defined and queryable in authorization checks.
- In-scope routes/endpoints requiring membership checks are identified.
- Post-login family-group entry experience is available as the denied-access redirect destination.

## Assumptions
- Membership is the only authorization rule in scope for this story.
- Group selection/entry UX is out of scope and handled by Epic 2 stories.
- Denied access for phase 1 uses redirect-plus-message behavior rather than a dedicated unauthorized screen.

## Testable Outcomes
- Manual test: user cannot access another family group by URL manipulation.
- Manual test: authorized member can access their own group-scoped route/data.
- Manual test: non-member access redirects the user to the post-login family-group entry experience with a clear access-denied message.
- Automated test: non-member access to a group-scoped route/endpoint is denied.
- Automated test: member access to the same route/endpoint is allowed.

## Open Questions for PO
- None for phase 1.

## Readiness Assessment
**Ready for Development**

Reason: the user-facing behavior for denied non-member access is now explicitly defined, keeping the story bounded, consistent with the current PRD, and testable.

## Sizing Note
Focus on authorization guard/check logic only. Do not include group selection UI.
