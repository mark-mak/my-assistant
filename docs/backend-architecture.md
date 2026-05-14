# Backend Architecture

## Overview

This document describes the suggested backend architecture for **my-assistant** — a conversational AI assistant application with product modules for member management, scheduling, reminders, and money summaries. The architecture prioritises clear domain boundaries, secure integrations, maintainability, and readiness for incremental scaling.

---

## Technology Stack

| Layer | Technology | Rationale |
|---|---|---|
| Runtime | Node.js 20+ | Mature ecosystem, strong async I/O support, broad deployment options |
| Framework | NestJS | Structured modules, dependency injection, strong TypeScript support |
| Language | TypeScript | Shared typing, safer refactoring, consistent contracts across services |
| API Style | REST + WebSocket/streaming endpoints | Simple CRUD flows plus real-time assistant responses |
| Database | PostgreSQL | Relational consistency, strong querying for reporting and scheduling data |
| ORM | Prisma | Typed schema management, migrations, ergonomic data access |
| Cache / Queue | Redis | Short-lived caching, rate limiting, and async job coordination |
| Background Jobs | BullMQ | Reliable processing for reminders, sync work, and deferred tasks |
| Authentication | JWT + refresh token rotation | Stateless API access with secure session renewal |
| Testing | Vitest / Jest + Supertest | Fast unit tests and practical API/integration coverage |
| Observability | Structured logging + metrics + tracing | Easier debugging, performance monitoring, and incident response |

---

## Project Structure

```
src/
├── app.module.ts                  # Root module composition
├── common/                        # Shared guards, interceptors, filters, pipes, utils
├── config/                        # Environment validation and configuration loaders
├── modules/
│   ├── auth/                      # Login, tokens, session security
│   ├── users/                     # User profiles and preferences
│   ├── members/                   # Family member lifecycle and soft delete rules
│   ├── calendar/                  # Schedules, recurrence, overlap handling
│   ├── reminders/                 # Reminder rules and due-soon logic
│   ├── money/                     # Spending records, summaries, category reporting
│   ├── audit/                     # Updated-by / updated-at metadata handling
│   └── assistant/                 # Prompt orchestration and streaming responses
├── infrastructure/
│   ├── database/                  # Prisma client, migrations, repositories
│   ├── cache/                     # Redis clients and caching helpers
│   ├── queue/                     # BullMQ queues, workers, job registration
│   ├── messaging/                 # Event publishing / subscription helpers
│   └── ai/                        # LLM provider adapters and model clients
├── interfaces/
│   ├── http/                      # Controllers, DTOs, request/response contracts
│   ├── websocket/                 # Gateways and streaming contracts
│   └── jobs/                      # Background job payload types
└── main.ts                        # Bootstrap and global middleware setup
```

---

## Architecture Layers

### 1. Interface Layer
Controllers and gateways accept HTTP or streaming requests, validate input, enforce authentication and authorization, and map external payloads to application DTOs.

### 2. Application Layer
Use-case services coordinate workflows such as creating reminders, generating money summaries, or streaming assistant replies. This layer owns orchestration, not persistence details.

### 3. Domain Layer
Domain services and entities encode business rules such as soft-delete visibility, recurrence limits, reminder offsets, default sorting, and audit metadata requirements.

### 4. Infrastructure Layer
Repositories, provider adapters, queues, and caches handle technical concerns including database access, background work, and third-party AI integrations.

### 5. Cross-Cutting Concerns
Authentication, authorization, validation, logging, metrics, tracing, and error handling are applied consistently through shared middleware, guards, interceptors, and filters.

---

## Core Modules

### Auth
- Issues and refreshes tokens
- Protects routes with role- and scope-aware guards
- Tracks session-level context such as selected family member when required

### Members
- Supports soft deletion
- Preserves historical references to deleted members
- Separates active-selection behavior from historical display behavior

### Calendar
- Supports month-view scheduling needs
- Allows overlapping items
- Enforces recurrence rules, including the one-year maximum window and HKT defaults

### Reminders
- Calculates due-soon state from configured reminder offsets
- Schedules one-off reminder jobs
- Shares reminder behavior consistently across supported modules

### Money
- Stores spending records with controlled categories and currency defaults
- Produces filtered summaries grouped by category
- Ensures chart and table totals are derived from the same query rules

### Audit
- Centralises updated-at and updated-by population
- Exposes audit metadata consistently for detail and list views

### Assistant
- Accepts chat requests
- Builds context from user, member, and product data when relevant
- Streams generated responses back to clients while persisting conversation state

---

## Data Flow

```
Client Request
      │
      ▼
Controller / Gateway
      │
      ▼
Validation + Auth Guard
      │
      ▼
Application Service
      │
      ├── reads/writes via Repository
      │         │
      │         ▼
      │     PostgreSQL
      │
      ├── caches / rate limits via Redis
      │
      ├── enqueues deferred work
      │         │
      │         ▼
      │      BullMQ Worker
      │
      └── calls AI Provider Adapter
                │
                ▼
         Streaming / final response
```

---

## API Design

### REST Endpoints
Use REST for resource-oriented operations such as:

- `POST /auth/login`
- `GET /members`
- `PATCH /members/:id`
- `GET /calendar/events`
- `POST /reminders`
- `GET /money/summary`

### Streaming Endpoints
Use WebSocket or server-streaming endpoints for assistant conversations where the response is incremental and latency-sensitive.

### DTO and Validation Rules
- Validate all incoming payloads at the boundary
- Use explicit request and response DTOs rather than exposing database models directly
- Keep controlled values server-validated even if the frontend already restricts them

---

## Persistence Strategy

### Primary Data Store
PostgreSQL is the system of record for users, members, schedules, reminders, spending data, conversation metadata, and audit history.

### Data Modeling Principles
- Use soft-delete columns where historical visibility must be preserved
- Store timestamps in UTC while applying HKT defaults in business logic and presentation rules
- Represent recurrence rules explicitly so validation and future expansion remain manageable
- Keep summary/reporting queries derived from canonical transaction tables to avoid drift

### Migrations
All schema changes should be versioned through ORM migrations and reviewed alongside corresponding application changes.

---

## Background Processing

Background jobs handle work that should not block request latency:

- reminder dispatch
- recalculation or materialisation of heavy summaries when needed
- audit/event fan-out
- assistant post-processing and conversation enrichment

Jobs must be idempotent, retry-safe, and observable through queue metrics and logs.

---

## Security and Reliability

- Enforce authentication on all non-public routes
- Apply authorization checks at module boundaries, not only in controllers
- Validate and sanitise all external input
- Store secrets in environment configuration, never in source control
- Rate limit sensitive endpoints such as login and assistant generation
- Use structured error responses that avoid leaking internal details
- Add timeouts, retries, and circuit-breaking behavior around AI and other external providers

---

## Observability

- **Logs**: structured logs with request IDs, user context, and module names
- **Metrics**: request latency, queue depth, cache hit rate, reminder success rate, AI token usage
- **Tracing**: end-to-end traces across HTTP handlers, queues, database queries, and AI provider calls
- **Auditability**: changes to domain records should preserve who changed what and when

---

## Recommended Priorities vs. Further Consideration

### Recommended now

- Adopt a modular monolith first to keep delivery simple while preserving clear domain boundaries
- Centralise validation, auth, and audit handling as shared platform capabilities
- Use PostgreSQL as the canonical store and Redis only for ephemeral performance concerns
- Add background processing for reminders and other deferred workflows early
- Design assistant integrations behind provider interfaces so LLM vendors can change without large rewrites

### Further consideration

- Split modules into separate deployable services only when scaling or ownership pressures justify it
- Introduce event-driven integration patterns more broadly once module boundaries stabilise
- Add read replicas or precomputed reporting stores if money summaries become query-heavy
- Evaluate vector storage or retrieval augmentation when assistant context needs exceed transactional data lookup
- Expand policy-based authorization if the product evolves beyond simple role or scope checks
