# Story 1.2 — Protected route wrapper

## Description
Add a shared route guard or protected layout so authentication is enforced consistently for all protected routes.

## Acceptance Criteria (Definition of Done)
- Every route marked as protected requires an authenticated session.
- Public routes remain accessible without authentication.
- Direct navigation to a protected URL while signed out redirects the user to the login page.
- A signed-in user can access protected routes without being redirected to login.

## Dependencies / Blockers (Definition of Ready)
- Story 1.1 available.
- Route structure is known.
- Protected route list is identified.

## Assumptions
- This story enforces authentication only at route-entry level.
- Authorization checks (for example, family-group membership rules) are out of scope and handled in Story 1.3.
- Login, session creation, and logout behavior are handled in Story 1.1.

## Testable Outcomes
- Manual test: signed-out user navigating to each protected route is redirected to login.
- Manual test: signed-in user can open protected routes without login redirect.
- Manual test: public routes remain accessible while signed out.

## Readiness Assessment
**Ready for Development**

Reason: scope is clear and bounded, acceptance criteria are testable, and dependencies are identified with no unresolved product questions in this story.

## Sizing Note
Limit to route protection behavior only.
