# Story 9.1 — Shared status model for shopping and chores

## Description
Define and apply a shared status model for shopping and chore workflows where the same status meanings are intended to be reused across both features. In phase 1, both modules use the shared base status set from Story 6.1 without module-specific exceptions.

## Acceptance Criteria (Definition of Done)
- The phase-1 shared status values for both shopping and chores are: Draft, Ready, Done.
- The shared meanings are:
	- Draft: the item exists but is not yet treated as ready for execution or completion.
	- Ready: the item is prepared for execution in the normal working flow.
	- Done: the item has been completed.
- The in-scope flows for status alignment in this story are shopping-item creation, shopping-item status display and update, chore creation, and chore status display and update.
- Newly created shopping items default to Draft.
- Newly created chore items default to Draft.
- The required phase-1 status transitions are Draft to Ready and Ready to Done.
- No module-specific status exceptions are allowed for shopping or chores in phase 1.
- Direct Draft to Done transitions, backward transitions from Done or Ready to an earlier status, and additional statuses beyond Draft, Ready, Done are out of scope for this story.

## Dependencies / Blockers (Definition of Ready)
- Story 6.1 available.

## Assumptions
- This story covers status-model definition and alignment only.
- This story does not include unrelated workflow changes beyond applying the agreed status model.
- This story aligns shopping and chores to the shared base status values already defined in Story 6.1 rather than introducing a new feature-specific status vocabulary.
- This story does not define recurrence behavior, completion automation, or other module-specific workflow rules beyond the required shared status transitions.

## Testable Outcomes
- Manual test: newly created shopping items start in Draft and can progress to Ready and then Done.
- Manual test: newly created chore items start in Draft and can progress to Ready and then Done.
- Manual test: shopping and chore status controls do not expose module-specific extra statuses in phase 1.
- Review artifact: the shared status definitions, default status, required transitions, and explicit out-of-scope transitions are documented.

## Open Questions for PO
- None for phase 1.

## Readiness Assessment
**Ready for Development**

Reason: the phase-1 shared status set, meanings, in-scope flows, default status, required transitions, and explicit no-exceptions rule are now defined, keeping the story aligned with Story 6.1 and the PRD so implementation and QA can verify the status model objectively.

## Sizing Note
Focus on status alignment only.
