# Story 2.3 — No-family-group empty state

## Refined Description
Provide a post-login empty state for users who do not belong to any family group, with a clear path to start creating a family group. Scope is limited to this empty-state experience and its create-family-group call to action.

## Acceptance Criteria (Definition of Done)
- After login, a user with zero family-group memberships sees the no-family-group empty state.
- The empty state includes a clearly visible create-family-group call to action.
- Selecting the call to action routes the user into the create-family-group flow.
- The empty state does not include invitation, join-by-code, or family-group management features.

## Dependencies / Blockers (Definition of Ready)
- Story 2.1 available.
- Product decision confirmed for phase-1 empty-state behavior.
- Destination flow for the create-family-group call to action is confirmed.

## Assumptions
- Membership check for showing this state is based on the user having zero family-group memberships at login/post-login entry.
- This story covers empty-state UX only and relies on Story 2.2 for create-family-group behavior.

## Testable Outcomes
- Manual test: user with zero memberships sees the no-family-group empty state after login.
- Manual test: create-family-group CTA is visible and actionable from the empty state.
- Manual test: CTA navigation enters the create-family-group flow.
- Manual test: user with at least one family group does not see this empty state in normal post-login flow.

## Open Questions for PO
- What exact content requirements are needed in the empty state (title/body/help text), if any beyond a clear CTA?
- Should any secondary actions be present in phase 1, or only the create-family-group CTA?
- What user-facing behavior is required if navigation to the create-family-group flow fails?

## Readiness Assessment
**Not Ready for Development**

Reason: minimum empty-state content requirements, allowed secondary actions, and required failure behavior for CTA navigation still need PO clarification for fully testable implementation.

## Sizing Note
Keep to empty-state UX only.
