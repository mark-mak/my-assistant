# Story 2.2 — Create family group flow

## Refined Description
Enable a logged-in user to create a new family group from the post-login experience. This story covers only the create-family-group path, automatic creation of the creator's initial membership, and routing into the newly created family-group context after success.

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
- The post-login experience is the only in-scope entry point for this create flow in this story.

## Testable Outcomes
- Manual test: logged-in user can start the create-family-group flow from the post-login experience.
- Manual test: successful submission creates a family group and takes the user into that group context.
- Automated test: successful creation also creates membership for the creator in the new family group.
- Automated test: the created membership is associated with the same family group that was just created.

## Open Questions for PO
- What exact fields are required to create a family group in this story?
- What validation rules apply to those fields, including any naming constraints or uniqueness requirements?
- What is the expected in-app destination immediately after creation if there are multiple valid landing points inside the new family group?
- Should this flow require any specific confirmation or failure-state behavior beyond generic success/failure handling?

## Readiness Assessment
- **Not Ready for Development** — the required create fields, validation rules, and exact post-create destination still need PO clarification.

## Sizing Note
Do not include invitations or join-by-code in this story.
