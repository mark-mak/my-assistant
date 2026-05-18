# Story 1.1 — Login page and authenticated session

## Description
Implement the phase-1 login entry point and authenticated session lifecycle so users must sign in with email and password before accessing protected product features.

## Acceptance Criteria (Definition of Done)
- An unauthenticated user who navigates directly to a protected route is redirected to the login page.
- A user with valid email and password credentials can log in successfully.
- A user who submits invalid credentials remains on the login page and sees a clear non-technical error message.
- After successful login, the user enters an authenticated session and is routed to the post-login family-group entry experience.
- The authenticated session persists across browser refresh until the user logs out or the session expires.
- If a session expires while the user is on a protected page, the user is redirected to the login page and shown a clear session-expired message.
- A logged-in user can log out successfully.
- After logout, the user no longer has access to protected routes and is returned to the login page when attempting to access them.

## Dependencies / Blockers (Definition of Ready)
- Authentication approach/provider selected.
- Protected route list identified.
- Post-login family-group entry experience available as the login success destination.
- Session expiry handling supports redirecting the user to the login page with a session-expired message.

## Assumptions
- This story covers login, invalid-credential handling, session persistence, session expiry handling, and logout behavior only.
- Phase 1 login method is email and password only.
- After successful login, users enter the family-group entry experience handled by Epic 2 stories.
- Authorization, permissions, and family-group selection are out of scope for this story.
- Password reset, social login, magic link, MFA, and account recovery are out of scope for this story.
- Protected route enforcement beyond basic login redirection is handled in Story 1.2.

## Testable Outcomes
- Manual test: signed-out user attempting to open a protected route is redirected to the login page.
- Manual test: user with valid email and password credentials can log in and enter the post-login family-group entry experience.
- Manual test: invalid credentials keep the user on the login page and show a clear error message.
- Manual test: authenticated session remains active after browser refresh.
- Manual test: an expired session redirects the user from a protected page to the login page with a session-expired message.
- Manual test: logout ends the session and protected routes are no longer accessible.

## Open Questions for PO
- None for phase 1.

## Readiness Assessment
**Ready for Development**

Reason: the login method, post-login destination, invalid-credential handling, and session-expiry behavior are now explicitly defined, making the story bounded and testable.

## Sizing Note
Keep to basic login/session behavior only. Do not include permissions or family-group selection in this story.
