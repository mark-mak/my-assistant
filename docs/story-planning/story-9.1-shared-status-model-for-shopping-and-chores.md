# Story 9.1 — Shared status model for shopping and chores

## Description
Define and apply a shared status model for shopping and chore workflows where the same status meanings are intended to be reused across both features.

## Acceptance Criteria (Definition of Done)
- The shared status values and their meanings are explicitly defined and documented.
- The identified in-scope shopping and chore flows use the shared status values where alignment is required.
- Any approved flow-specific status differences are explicitly documented.

## Dependencies / Blockers (Definition of Ready)
- Story 6.1 available.
- Product confirmation on shared versus flow-specific statuses.

## Assumptions
- This story covers status-model definition and alignment only.
- This story does not include unrelated workflow changes beyond applying the agreed status model.

## Testable Outcomes
- Manual test: in-scope shopping items display the expected shared statuses.
- Manual test: in-scope chore items display the expected shared statuses.
- Review artifact: the shared status mapping and any approved exceptions are documented.

## Open Questions for PO
- What are the exact shared status values and definitions for phase 1?
- Which shopping and chore flows are in scope for status alignment in this story?
- Which status differences, if any, are intentionally allowed to remain flow-specific?

## Readiness Assessment
**Not Ready for Development**

Reason: the alignment goal is clear, but the exact shared status set, in-scope flows, and allowed exceptions are still undefined, so implementation and QA cannot verify this story objectively.

## Sizing Note
Focus on status alignment only.
