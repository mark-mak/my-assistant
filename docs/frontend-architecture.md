# Frontend Architecture

## Overview

This document describes the suggested frontend architecture for **my-assistant** — a conversational AI assistant web application. The architecture prioritises a clear separation of concerns, scalability, and an excellent developer experience.

---

## Technology Stack

| Layer | Technology | Rationale |
|---|---|---|
| Framework | [React 18](https://react.dev/) | Component-based UI, large ecosystem, concurrent rendering |
| Language | [TypeScript](https://www.typescriptlang.org/) | Static typing, better IDE support, fewer runtime errors |
| Build Tool | [Vite](https://vitejs.dev/) | Fast HMR, native ESM, optimised production bundles |
| Styling | [Tailwind CSS](https://tailwindcss.com/) | Utility-first, consistent design tokens, no CSS conflicts |
| State Management | [Zustand](https://zustand-demo.pmnd.rs/) | Lightweight, minimal boilerplate, easy async handling |
| Routing | [React Router v6](https://reactrouter.com/) | Declarative, nested routes, lazy-loading support |
| Data Fetching | [TanStack Query](https://tanstack.com/query) | Caching, background refetching, loading/error states |
| Testing | [Vitest](https://vitest.dev/) + [React Testing Library](https://testing-library.com/) | Fast unit & integration tests, accessibility-first queries |
| Linting | [ESLint](https://eslint.org/) + [Prettier](https://prettier.io/) | Consistent code style, catch common mistakes early |

---

## Project Structure

```
src/
├── assets/               # Static assets (images, fonts, icons)
├── components/           # Reusable, presentational UI components
│   ├── common/           # Buttons, inputs, modals, etc.
│   └── layout/           # Header, Sidebar, Footer, Page wrappers
├── features/             # Feature-based modules (co-locate logic + UI)
│   ├── chat/             # Conversation view, message list, input bar
│   ├── history/          # Past conversation list and search
│   └── settings/         # User preferences and configuration
├── hooks/                # Custom React hooks shared across features
├── lib/                  # Third-party wrappers and utility helpers
├── pages/                # Route-level components (thin wrappers)
├── services/             # API client and domain service functions
├── store/                # Zustand stores (global state slices)
├── styles/               # Global CSS / Tailwind base layer overrides
├── types/                # Shared TypeScript types and interfaces
└── main.tsx              # Application entry point
```

---

## Architecture Layers

### 1. Pages
Route-level components that are thin orchestrators. They pull together feature components and pass down only what is needed. Pages should contain minimal logic themselves.

### 2. Features
Self-contained modules that own their own components, hooks, and local state. Each feature folder should be independently understandable with minimal cross-feature imports.

### 3. Components
Purely presentational, stateless (or locally stateful) building blocks. They receive data and callbacks via props and have no knowledge of global state.

### 4. Store (Global State)
Zustand slices hold only the state that genuinely needs to be shared across features, such as the active conversation ID, authentication status, and UI theme. Server state (chat history, API responses) is managed by TanStack Query, not the store.

### 5. Services
All communication with the backend lives in `src/services/`. Functions here are plain `async` functions that call the REST/WebSocket API and return typed data. They are imported by TanStack Query hooks inside features.

---

## Data Flow

```
User Interaction
      │
      ▼
  Component
      │  calls hook
      ▼
  Feature Hook (TanStack Query / Zustand action)
      │  reads/writes
      ┌─────────────────────────┐
      │   TanStack Query Cache  │  ◄──── services/ (HTTP / WebSocket)
      └─────────────────────────┘
      │
      ▼
  Zustand Store (UI / session state)
      │
      ▼
  Component re-renders
```

---

## Key Design Decisions

### Feature-Sliced Organisation
Grouping code by feature rather than by type (e.g. `components/`, `hooks/`, `utils/`) means related code lives together. This makes features easy to reason about, refactor, or remove independently.

### Server State vs. Client State
- **Server state** (conversations, messages, user profile): managed by TanStack Query. It handles caching, background synchronisation, and loading/error states automatically.
- **Client state** (sidebar open, active theme, draft input): managed by Zustand. Kept as small as possible.

### Streaming Responses
The chat feature will consume streaming responses from the assistant API using the [Fetch Streams API](https://developer.mozilla.org/en-US/docs/Web/API/Streams_API) (or WebSocket). Messages are progressively appended to the UI as chunks arrive, giving the user a responsive experience.

### Accessibility
Components are built with semantic HTML and ARIA attributes. Keyboard navigation and screen-reader compatibility are first-class concerns, not afterthoughts.

---

## Routing

| Path | Page | Description |
|---|---|---|
| `/` | `HomePage` | Landing / new conversation entry point |
| `/chat/:conversationId` | `ChatPage` | Active conversation view |
| `/history` | `HistoryPage` | Browse past conversations |
| `/settings` | `SettingsPage` | User preferences |

Lazy loading (`React.lazy`) is applied to all page-level components so that only the code needed for the current route is downloaded.

---

## Performance Considerations

- **Code splitting** via Vite's dynamic imports and `React.lazy` keeps the initial bundle small.
- **Virtualised lists** (e.g. [TanStack Virtual](https://tanstack.com/virtual)) for long conversation histories to avoid rendering thousands of DOM nodes.
- **Memoisation** with `React.memo`, `useMemo`, and `useCallback` applied judiciously at component boundaries identified by profiling — not speculatively.
- **Service Worker** (via [Vite PWA plugin](https://vite-pwa-org.netlify.app/)) for offline support and asset caching.

---

## Testing Strategy

| Level | Tooling | What to test |
|---|---|---|
| Unit | Vitest | Pure functions in `lib/`, `services/`, and store actions |
| Component | React Testing Library | Individual components in isolation with mocked props |
| Integration | React Testing Library | Full feature flows (e.g. sending a message end-to-end within the UI) |
| E2E | [Playwright](https://playwright.dev/) | Critical user journeys against a running dev server |

---

## Environment Configuration

Configuration is managed through `.env` files loaded by Vite:

```
VITE_API_BASE_URL=      # Backend API base URL
VITE_WS_URL=            # WebSocket endpoint for streaming
VITE_APP_ENV=           # development | staging | production
```

All client-side env variables must be prefixed with `VITE_` to be exposed to the browser bundle.

---

## Recommended Priorities vs. Further Consideration

To keep the first implementation pragmatic, the following topics are split into **recommended now** and **further consideration**.

### Recommended now

- **Design tokens and reusable UI primitives**: establish colour, spacing, typography, and base components early so the UI remains consistent without committing to a full design system upfront.
- **Feature-Sliced Design direction**: keep the feature-oriented structure described above as the default scaling pattern for the application.
- **End-to-end type safety**: use typed service contracts and shared domain models so API interactions remain explicit and safe.
- **Zustand + TanStack Query split**: keep UI/session state in Zustand and server state in TanStack Query.
- **Linting, formatting, and CI quality gates**: adopt ESLint, Prettier, type-checking, and automated tests as the minimum merge gate.

### Further consideration

- **Micro-frontends**: only introduce if multiple teams need independent deployment and ownership boundaries.
- **Hybrid rendering or edge deployments**: evaluate later if SEO, first-load performance, or regional latency becomes a real product requirement.
- **Visual regression testing**: useful once the interface becomes stable enough that screenshot baselines are worth maintaining.
- **Broader DevSecOps automation**: expand beyond baseline CI gates when deployment maturity and team size justify the extra operational overhead.
- **i18n**: add when multilingual support becomes a confirmed product need rather than an assumption.
