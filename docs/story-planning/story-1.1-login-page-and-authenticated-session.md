# Story 1.1 — Login page and authenticated session

## Description
Implement a login page and authenticated session flow so users must sign in before accessing protected product features.

## Acceptance Criteria (Definition of Done)
- Unauthenticated users are redirected to the login page when trying to access protected content.
- Users can log in successfully.
- Authenticated session persists across refresh until logout or expiry.
- Users can log out successfully.

## Dependencies / Blockers (Definition of Ready)
- Authentication approach/provider selected.
- Protected route list identified.

## Testable Outcomes
- Manual test: signed-out user cannot access protected page.
- Manual test: successful login lands user in post-login flow.
- Manual test: logout returns user to login.

## Sizing Note
Keep to basic login/session behavior only. Do not include permissions or family-group selection in this story.
