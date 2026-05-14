# Story 3.1 — Prevent removing the last family member

## Description
Enforce the rule that a family group must always have at least one active member.

## Acceptance Criteria (Definition of Done)
- System blocks removal of the last active member.
- System blocks soft deletion of the last active member.
- Clear error/feedback is returned for blocked actions.

## Dependencies / Blockers (Definition of Ready)
- Membership model defined.
- Removal and soft-delete paths identified.

## Testable Outcomes
- Automated test: removing last member fails.
- Manual test: blocked action shows clear message.

## Sizing Note
This story is about rule enforcement only, not the full removal UX.
