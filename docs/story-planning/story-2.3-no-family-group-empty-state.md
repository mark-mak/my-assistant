# Story 2.3 — No-family-group empty state

## Refined Description
Provide a post-login empty state for users who do not belong to any family group, with a clear path to start creating a family group. In phase 1, this screen explains that the user is not yet part of any family group and offers one primary action to start the create-family-group flow.

## Acceptance Criteria (Definition of Done)
- After login, a user with zero family-group memberships sees the no-family-group empty state.
- The empty state includes a title communicating that the user does not have a family group yet.
- The empty state includes short supporting text explaining that the user can create a family group to continue.
- The empty state includes one clearly visible primary create-family-group call to action.
- Selecting the call to action routes the user into the create-family-group flow.
- The empty state does not include invitation, join-by-code, browsing other groups, or family-group management features.
- The empty state does not include any secondary action in phase 1 beyond the primary create-family-group CTA.
- If the create-family-group CTA cannot open the create flow, the user remains on the empty-state screen and sees a clear non-technical error message telling them the create flow could not be opened and they should try again.

## Dependencies / Blockers (Definition of Ready)
- Story 2.1 available.
- Destination flow for the create-family-group call to action is confirmed.


## Assumptions
- Membership check for showing this state is based on the user having zero family-group memberships at login/post-login entry.
- This story covers empty-state UX only and relies on Story 2.2 for create-family-group behavior.
- Phase 1 uses an empty-state screen rather than mandatory immediate redirect into the create flow.
- The create-family-group CTA opens the create flow defined in Story 2.2.

## Testable Outcomes
- Manual test: user with zero memberships sees the no-family-group empty state after login.
- Manual test: the empty state shows the approved title, supporting text, and one primary create-family-group CTA.
- Manual test: CTA navigation enters the create-family-group flow.
- Manual test: if CTA navigation fails, the empty state remains visible and shows a clear retryable error message.
- Manual test: user with at least one family group does not see this empty state in normal post-login flow.

## Open Questions for PO
- None for phase 1.

## Readiness Assessment
**Ready for Development**

Reason: the phase-1 empty-state content, allowed actions, and CTA failure behavior are now explicitly defined and aligned with the Story 2.2 create flow, making the story bounded and testable.

## Sizing Note
Keep to empty-state UX only.
