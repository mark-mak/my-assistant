# Story 4.1 — Soft delete member

## Description
Implement soft delete behavior for members while preserving historical references.

## Acceptance Criteria (Definition of Done)
- Member can be soft deleted.
- Historical records continue to show deleted member references.
- Soft-deleted members are excluded from active selectors.

## Dependencies / Blockers (Definition of Ready)
- Story 3.1 available.
- Historical reference behavior agreed.

## Testable Outcomes
- Automated test: deleted member still appears in historical record rendering.
- Manual test: deleted member does not appear in active selector.

## Sizing Note
Focus on member deletion behavior only.
