# Agents Index

This directory contains role-specific agent instructions for product planning and pre-development review.

## When to Use Each Agent

### PO Agent
Use `po-agent.md` when you need product decisions on:
- scope
- business rules
- defaults
- permissions
- product intent and approval

### BA Story Review Agent
Use `ba-story-review-agent.md` when product decisions already exist and a story needs refinement for:
- clarity
- completeness
- acceptance criteria quality
- assumptions, blockers, and edge cases

### PM Agent
Use `pm-agent.md` when you need help with:
- backlog priority
- sequencing
- phase fit
- delivery-planning tradeoffs

Use PO for product-rule and scope decisions first; use PM once the scope is approved and the question is about ordering, planning, or tradeoffs.

### QA Review Agent
Use `qa-review-agent.md` when you need to check:
- testability
- acceptance criteria gaps
- negative cases
- verification coverage expectations

### Engineering Review Agent
Use `engineering-review-agent.md` when you need to review:
- technical feasibility
- architecture alignment
- implementation surface
- engineering dependencies and risks

## Typical Handoff Flow

Use this path when the work starts from incomplete planning:

1. PO agent for product decisions and scope.
2. BA agent for story refinement.
3. PM agent for priority and sequencing review when needed.
4. QA agent for testability review.
5. Engineering review agent for feasibility and architecture-fit review.

The order can change depending on the question, but PO should resolve missing product decisions before downstream review depends on them.