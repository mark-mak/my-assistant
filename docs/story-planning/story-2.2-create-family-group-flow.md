# Story 2.2 — Create family group flow

## Refined Description
Enable a logged-in user to create a new family group from the post-login experience. Scope is limited to create flow entry, successful group creation, automatic creator membership, and routing into the new family-group context.

## Acceptance Criteria (Definition of Done)
- From the post-login experience, a logged-in user can open the create-family-group flow.
- A logged-in user can submit the required information to create a family group.
- When creation succeeds, a new family group is created and the creator is added automatically as its first member.
- When creation succeeds, the user is routed directly into the newly created family group context.
- The create flow does not include invitations, join-by-code, or any membership onboarding beyond the creator becoming the first member.

## Dependencies / Blockers (Definition of Ready)
- Story 2.1 available.
- Group creation API/data path available.
- The minimum required family-group fields and validation rules are confirmed.
- The expected post-create destination inside the new family group context is confirmed.

## Assumptions
- The creator is treated as an active member of the new family group immediately after successful creation.
- In this story, create-family-group entry comes from the post-login experience.

## Testable Outcomes
- Manual test: logged-in user can start the create-family-group flow from the post-login experience.
- Manual test: successful submission creates a family group and takes the user into that group context.
- Automated test: successful creation also creates membership for the creator in the new family group.
- Automated test: the created membership is associated with the same family group that was just created.

## Open Questions for PO
- What exact fields are required to create a family group in this story?
- What validation rules apply to those fields, including any naming constraints or uniqueness requirements?
- What is the expected in-app destination immediately after creation if there are multiple valid landing points inside the new family group?
- What user-facing behavior is required for creation failures (for example, validation vs. backend failure)?

## Readiness Assessment
**Not Ready for Development**

Reason: required create fields, field validation rules, post-create destination, and failure-state behavior need PO clarification before implementation can be considered testably complete.

## Sizing Note
Do not include invitations or join-by-code in this story.
