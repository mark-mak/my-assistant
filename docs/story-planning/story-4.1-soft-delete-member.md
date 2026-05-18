# Story 4.1 — Soft delete member

## Refined Description
Implement member soft-delete behavior that deactivates a member without removing historical references tied to that member.

## Acceptance Criteria (Definition of Done)
- A member can be soft deleted through the intended member-management flow.
- After soft delete, the member is no longer returned in active-member selectors.
- Historical records that previously referenced the member continue to display that member reference after soft delete.
- Soft deleting a member follows the minimum-one-active-member guardrail from Story 3.1.

## Dependencies / Blockers (Definition of Ready)
- Story 3.1 available.
- Historical reference behavior agreed.
- Member-management soft-delete entry point identified.

## Assumptions
- This story covers soft-delete behavior only; visibility-context rules remain in Story 4.2.
- Existing historical records already store enough member linkage to keep references visible after soft delete.

## Testable Outcomes
- Automated test: soft-deleted member is excluded from active-member selectors.
- Automated test: historical records continue to show references to a soft-deleted member.
- Manual test: soft-delete action succeeds for a non-last active member.
- Manual test: when attempting to soft delete the last active member, the action is blocked per Story 3.1.

## Readiness Assessment
**Ready for Development**

Reason: scope is clear, acceptance criteria are testable, and dependencies are explicitly identified.

## Sizing Note
Focus on member deletion behavior only.
