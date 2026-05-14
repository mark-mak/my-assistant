# Story 2.2 — Create family group flow

## Description
Allow a logged-in user to create a new family group from the post-login experience.

## Acceptance Criteria (Definition of Done)
- User can create a family group.
- Creator becomes the first member automatically.
- User is routed into the created family group after success.

## Dependencies / Blockers (Definition of Ready)
- Story 2.1 available.
- Group creation API/data path available.

## Testable Outcomes
- Manual test: creating a family group succeeds.
- Automated test: created group includes creator as member.

## Sizing Note
Do not include invitations or join-by-code in this story.
