# Story 6.1 — Shared controlled values definitions

## Description
Define and expose shared controlled value definitions for currency, priority, status, and money spent category so in-scope features use one consistent source of allowed values.

## Acceptance Criteria (Definition of Done)
- Allowed values for currency, priority, status, and money spent category are defined in one shared source.
- HKD is the default and only supported currency in phase 1.
- The defined in-scope consumers use the shared definitions instead of feature-specific duplicates.

## Dependencies / Blockers (Definition of Ready)
- PRD values finalized.
- Initial in-scope consumers identified.

## Assumptions
- This story defines and exposes shared controlled values only.
- This story does not include feature-specific form or screen implementation beyond verifying agreed integration points.

## Testable Outcomes
- Automated test: values outside the shared definitions are rejected by consumers that rely on them.
- Manual test: each in-scope consumer presents the expected shared options.

## Open Questions for PO
- What are the exact phase-1 allowed values for priority, status, and money spent category?
- Which features or modules are the required initial consumers for this story?
- Does "status" refer to one shared status model across features, or will feature-specific status models be defined in later stories?

## Readiness Assessment
**Not Ready for Development**

Reason: the intent is clear, but the exact phase-1 controlled values and the required initial consumers are not yet explicit, so developers cannot implement or QA cannot verify this story objectively.

## Sizing Note
Do not include feature-specific form wiring beyond verifying integration points.
