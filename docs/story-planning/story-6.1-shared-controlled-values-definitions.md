# Story 6.1 — Shared controlled values definitions

## Description
Define and expose shared controlled value definitions for currency, priority, status, and money spent category so in-scope phase-1 features use one consistent source of allowed values. In phase 1, this story establishes the base controlled values from the PRD, while broader cross-feature status alignment remains deferred to Story 9.1.

## Acceptance Criteria (Definition of Done)
- Allowed values for currency, priority, status, and money spent category are defined in one shared source.
- HKD is the default and only supported currency in phase 1.
- The phase-1 allowed priority values are: Highest, High, Medium, Low, Lowest.
- The phase-1 base status values are: Draft, Ready, Done.
- The phase-1 money spent category values are: Dining, Entertainment, Shopping, Travel, Transportation, Household, Personal Care, Fixed Payment, Medical and Health, Personal Development, Others.
- In phase 1, this story defines the shared base status values only; feature-specific status alignment and reuse across shopping and chores are deferred to Story 9.1.
- The required initial consumers for this story are:
	- money-entry or money-management flows that use currency and money spent category
	- any phase-1 flows that already expose priority selection
	- any phase-1 flows that already expose the base Draft/Ready/Done status set
- The defined in-scope consumers use the shared definitions instead of feature-specific duplicates.

## Dependencies / Blockers (Definition of Ready)
- PRD values finalized.

## Assumptions
- This story defines and exposes shared controlled values only.
- This story does not include feature-specific form or screen implementation beyond verifying agreed integration points.
- Currency remains limited to HKD in phase 1.
- This story does not force all future features to adopt Draft/Ready/Done if a later story intentionally defines a feature-specific status model.

## Testable Outcomes
- Automated test: values outside the shared definitions are rejected by consumers that rely on them.
- Manual test: money-entry or money-management consumers present HKD and the approved money spent categories from the shared source.
- Manual test: priority consumers present Highest, High, Medium, Low, Lowest from the shared source.
- Manual test: any current phase-1 consumers of Draft/Ready/Done present those values from the shared source.

## Open Questions for PO
- None for phase 1.

## Readiness Assessment
**Ready for Development**

Reason: the phase-1 controlled values, the initial required consumers, and the decision to defer broader cross-feature status alignment to Story 9.1 are now explicit, making the story implementable and testable.

## Sizing Note
Do not include feature-specific form wiring beyond verifying integration points.
