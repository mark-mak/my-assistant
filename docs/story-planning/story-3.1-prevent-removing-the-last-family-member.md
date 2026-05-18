# Story 3.1 — Prevent removing the last family member

## Refined Description
Enforce the minimum-one-member rule so a family group cannot end up with zero active members. In phase 1, an active member means a current family-group member who has not been removed or soft deleted. This story covers rule enforcement for member removal and soft deletion only.

## Acceptance Criteria (Definition of Done)
- If a family group has exactly one active member, removing that member is blocked.
- If a family group has exactly one active member, soft deleting that member is blocked.
- For this rule, only current non-deleted members count as active members.
- Pending, invited, suspended, or other non-active states do not count toward the minimum-one-member rule in phase 1.
- The rule is enforced consistently in both removal and soft-delete paths.
- A blocked removal or soft-delete action returns a clear explanatory message that the family group must keep at least one active member.
- The blocked-action message makes clear that the requested removal or deletion did not happen.

## Dependencies / Blockers (Definition of Ready)
- Membership model defined.
- Removal and soft-delete paths identified.

## Assumptions
- In phase 1, only current non-deleted members are counted toward this rule.
- Pending, invited, suspended, or comparable non-active states are either out of scope or do not satisfy the rule.
- Story 3.2 will cover detailed removal UX and messaging beyond the blocked-action rule.

## Testable Outcomes
- Automated test: removal attempt for the last active member is rejected.
- Automated test: soft-delete attempt for the last active member is rejected.
- Manual test: blocked removal shows a clear explanation that the family group must keep at least one active member and the action did not occur.
- Manual test: blocked soft delete shows the same rule explanation and confirms the action did not occur.
- Manual test: removal/soft-delete succeeds when more than one active member exists.

## Open Questions for PO
- None for phase 1.

## Readiness Assessment
**Ready for Development**

Reason: the phase-1 definition of active member, the treatment of non-active states, and the required blocked-action message behavior are now explicitly defined, making the rule implementation-ready and testable.

## Sizing Note
This story is about rule enforcement only, not the full removal UX.
