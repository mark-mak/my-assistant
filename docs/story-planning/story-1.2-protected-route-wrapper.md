# Story 1.2 — Protected route wrapper

## Description
Add a shared route guard or protected layout so authenticated access is enforced consistently across the application.

## Acceptance Criteria (Definition of Done)
- All protected routes require authentication.
- Public routes remain accessible without authentication.
- Direct navigation to protected URLs while signed out redirects to login.

## Dependencies / Blockers (Definition of Ready)
- Story 1.1 available.
- Route structure is known.

## Testable Outcomes
- Manual test: protected routes redirect when signed out.
- Manual test: protected routes render normally when signed in.

## Sizing Note
Limit to route protection behavior only.
