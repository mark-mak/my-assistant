# Story 5.2 — Sort and filter persistence

## Description
Persist sort and filter state across refresh while preserving PRD defaults as fallback behavior.

## Acceptance Criteria (Definition of Done)
- Refresh preserves expected sort/filter state.
- If no saved state exists, PRD defaults are used.
- Persistence behavior is consistent in all in-scope modules.

## Dependencies / Blockers (Definition of Ready)
- Story 5.1 available.
- Persistence model chosen.

## Testable Outcomes
- Manual test: selected sort/filter persists after refresh.
- Manual test: new/cleared state falls back to defaults.

## Sizing Note
Keep to persistence only.
