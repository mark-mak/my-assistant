# Story 1.3 — Membership-based authorization checks

## Description
Implement authorization checks so users can only access family groups they belong to.

## Acceptance Criteria (Definition of Done)
- Users can access only their own family-group-scoped data.
- Direct navigation to a non-member family group is blocked.
- Unauthorized access is handled consistently.

## Dependencies / Blockers (Definition of Ready)
- Story 1.1 available.
- Family group membership data model defined.

## Testable Outcomes
- Manual test: user cannot access another group by URL manipulation.
- Automated test: authorization check fails for non-member access.

## Sizing Note
Focus on guard/check logic, not group selection UI.
