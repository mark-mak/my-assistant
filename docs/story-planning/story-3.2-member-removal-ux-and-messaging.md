# Story 3.2 — Member removal UX and messaging

## Refined Description
Provide removal confirmation and clear user messaging for member-removal actions, including when removal is blocked by the last-active-member guardrail from Story 3.1.

## Acceptance Criteria (Definition of Done)
- Starting a member-removal action shows a confirmation step before the action is finalized.
- The confirmation clearly identifies the member being removed.
- If removal is blocked by the Story 3.1 rule, the UI shows a clear explanation that the last active member cannot be removed.
- If more than one active member exists and removal succeeds, the UI reflects the successful removal in the member-management view.

## Dependencies / Blockers (Definition of Ready)
- Story 3.1 available.
- Removal UI location identified.
- Member-management view and state refresh behavior are defined.

## Assumptions
- This story covers UX/messaging for removal flows only; guardrail enforcement logic remains in Story 3.1.
- “Blocked last-member case” refers to the backend/domain rejection returned by Story 3.1.

## Testable Outcomes
- Manual test: initiating removal shows a confirmation step with the selected member identity.
- Manual test: canceling confirmation keeps the member unchanged.
- Manual test: blocked last-member response is displayed with clear explanatory messaging.
- Manual test: valid removal (more than one active member) updates the member-management view correctly.

## Readiness Assessment
**Ready for Development**

Reason: scope is bounded to UX/messaging, dependencies are identified, and acceptance criteria are now specific and testable.

## Sizing Note
UI/UX only. Do not duplicate server rule logic here.
