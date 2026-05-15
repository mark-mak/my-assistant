# Story 4.2 — Soft-deleted member visibility matrix

## Refined Description
Define the visibility matrix for soft-deleted members by explicitly listing which contexts should show them and which should hide them, then implement those agreed rules consistently.

## Acceptance Criteria (Definition of Done)
- A visibility matrix is documented with explicit context-by-context rules for soft-deleted member visibility.
- The matrix distinguishes at least display contexts versus selection contexts.
- In implemented in-scope views, soft-deleted member visibility behavior matches the approved matrix.
- Any context not included in the approved matrix is treated as out of scope for this story.

## Dependencies / Blockers (Definition of Ready)
- Product clarification on visibility contexts.
- Story 4.1 available.
- In-scope screens/components for this story are identified.

## Assumptions
- This story defines and applies visibility rules only; it does not change soft-delete behavior itself from Story 4.1.
- The visibility matrix is the single source of truth for scope in this story.

## Testable Outcomes
- Review artifact: visibility matrix exists and lists each in-scope context with Show or Hide behavior.
- Manual test: each in-scope display context matches the matrix rule.
- Manual test: each in-scope selection context matches the matrix rule.

## Open Questions for PO
- Which exact views/components are in scope for phase 1 of this matrix?
- For each in-scope context, should soft-deleted members be shown or hidden?
- If shown in a display context, is any explicit indicator needed to mark a member as soft-deleted?

## Readiness Assessment
**Not Ready for Development**

Reason: core product decisions for context-by-context visibility are still pending PO clarification.

## Sizing Note
Keep to visibility rules only.
