# Story 4.2 — Soft-deleted member visibility matrix

## Refined Description
Define the phase-1 visibility matrix for soft-deleted members by explicitly listing which in-scope contexts should show them and which should hide them, then implement those rules consistently. In phase 1, soft-deleted members remain visible only where needed to preserve historical record meaning and are hidden from all active selection and active-member management contexts.

## Acceptance Criteria (Definition of Done)
- A visibility matrix is documented with explicit phase-1 rules for these in-scope contexts:
	- historical record detail views
	- historical record list/table views
	- active member selectors in forms or filters
	- member-assignment/member-picker controls
	- member-management active-member lists
- In phase 1, soft-deleted members are shown in historical record detail views and historical record list/table views when those records already reference the deleted member.
- In phase 1, soft-deleted members are hidden from active member selectors, member-assignment/member-picker controls, and member-management active-member lists.
- When a soft-deleted member remains visible in a historical display context, the UI shows a clear deleted-status indicator next to that member reference.
- In implemented in-scope views, soft-deleted member visibility behavior matches the approved matrix.
- Any context not included in the approved matrix is treated as out of scope for this story.

## Dependencies / Blockers (Definition of Ready)
- Story 4.1 available.

## Assumptions
- This story defines and applies visibility rules only; it does not change soft-delete behavior itself from Story 4.1.
- The visibility matrix is the single source of truth for scope in this story.
- Historical display contexts mean views rendering previously saved records that already reference the member.
- Phase 1 does not include restoring deleted members or exposing deleted-member-only management screens in this story.

## Testable Outcomes
- Review artifact: visibility matrix exists and lists each in-scope context with Show or Hide behavior.
- Manual test: historical record detail views continue showing soft-deleted member references with a deleted-status indicator.
- Manual test: historical record list/table views continue showing soft-deleted member references with a deleted-status indicator.
- Manual test: active member selectors, member-assignment/member-picker controls, and active-member lists do not show soft-deleted members.

## Open Questions for PO
- None for phase 1.

## Readiness Assessment
**Ready for Development**

Reason: the phase-1 in-scope contexts, show/hide rules, and deleted-status indicator requirement are now explicitly defined, making the visibility matrix implementable and testable.

## Sizing Note
Keep to visibility rules only.
