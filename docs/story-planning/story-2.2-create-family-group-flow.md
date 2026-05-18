# Story 2.2 — Create family group flow

## Refined Description
Enable a logged-in user to create a new family group from the post-login experience. In phase 1, the create flow collects only the family-group name, creates the group, automatically adds the creator as the first active member, and routes the user into the newly created family-group context.

## Acceptance Criteria (Definition of Done)
- From the post-login experience, a logged-in user can open the create-family-group flow.
- The create-family-group flow requires one input field: family-group name.
- A logged-in user can submit a valid family-group name to create a family group.
- The family-group name is required, is trimmed before save, and must not be empty after trimming.
- The family-group name must be between 1 and 50 characters after trimming.
- When creation succeeds, a new family group is created and the creator is added automatically as its first member.
- When creation succeeds, the user is routed directly into the newly created family group's default entered context, using the same in-group destination shape used after selecting a group from Story 2.1.
- If the user submits invalid input, the create flow remains open and shows a clear inline validation message without creating a family group.
- If group creation fails after valid submission, the create flow remains open, preserves the entered name, and shows a clear non-technical error message that the group could not be created and the user should try again.
- The create flow does not include invitations, join-by-code, or any membership onboarding beyond the creator becoming the first member.

## Dependencies / Blockers (Definition of Ready)
- Story 2.1 available.
- Group creation API/data path available.
- The in-group destination used after selecting an existing group in Story 2.1 is available for reuse after successful creation.

## Assumptions
- The creator is treated as an active member of the new family group immediately after successful creation.
- In this story, create-family-group entry comes from the post-login experience.
- Phase 1 does not require description, avatar, invite settings, join code, or other family-group metadata at creation time.
- Family-group name uniqueness is not required in phase 1.

## Testable Outcomes
- Manual test: logged-in user can start the create-family-group flow from the post-login experience.
- Manual test: entering a valid family-group name creates a family group and takes the user into that group's default entered context.
- Manual test: empty or over-limit family-group names are blocked with clear inline validation and no group is created.
- Manual test: if creation fails after valid submission, the flow stays open, the entered name is preserved, and a clear retryable error message is shown.
- Automated test: successful creation also creates membership for the creator in the new family group.
- Automated test: the created membership is associated with the same family group that was just created.

## Open Questions for PO
- None for phase 1.

## Readiness Assessment
**Ready for Development**

Reason: the required create-group input, validation rules, failure behavior, and post-create destination are now explicitly defined, keeping the story aligned with Epic 2 and ready for implementation and QA.

## Sizing Note
Do not include invitations or join-by-code in this story.
