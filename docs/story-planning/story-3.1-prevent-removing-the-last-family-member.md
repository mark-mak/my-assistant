# Story 3.1 — Prevent removing the last family member

## Refined Description
Enforce the minimum-one-member rule so a family group cannot end up with zero active members. This story covers rule enforcement for member removal and soft deletion only.

## Acceptance Criteria (Definition of Done)
- If a family group has exactly one active member, removing that member is blocked.
- If a family group has exactly one active member, soft deleting that member is blocked.
- The rule is enforced consistently in both removal and soft-delete paths.
- A blocked action returns clear, user-facing feedback.

## Dependencies / Blockers (Definition of Ready)
- Membership model defined.
- Removal and soft-delete paths identified.
- Expected error/feedback contract is defined for blocked actions.

## Assumptions
- “Last active member” means the final remaining member in active status within a family group.
- Story 3.2 will cover detailed removal UX and messaging beyond the blocked-action rule.

## Testable Outcomes
- Automated test: removal attempt for the last active member is rejected.
- Automated test: soft-delete attempt for the last active member is rejected.
- Manual test: blocked actions present clear user-facing feedback.
- Manual test: removal/soft-delete succeeds when more than one active member exists.

## Open Questions for PO
- What is the exact definition of “active member” for this rule (for example, are pending/invited/suspended states counted as active)?
- What exact user-facing message content is required when the last-member action is blocked?

## Readiness Assessment
**Not Ready for Development**

Reason: the definition of “active member” and required blocked-action message content still need PO confirmation for unambiguous implementation and testing.

## Sizing Note
This story is about rule enforcement only, not the full removal UX.
