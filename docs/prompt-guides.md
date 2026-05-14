# Prompt Guides for Copilot

This document provides practical prompt patterns for working with Copilot in a repository workflow. The goal is to make requests easier to execute reliably by keeping them explicit, atomic, and verifiable.

## Core Prompting Principles

Use these principles in every repo write request:

1. **Name the repository and branch explicitly**
   - Example: `In repo mark-mak/my-assistant, on branch dev...`
2. **Ask for one main action at a time**
   - Avoid combining planning, editing, splitting, and issue creation in one request.
3. **Specify exact file paths when possible**
   - This reduces ambiguity and prevents Copilot from choosing the wrong target.
4. **State the expected output format**
   - Example: report created files, branch, and commit SHA.
5. **Ask for verification after write operations**
   - This helps confirm the action completed successfully.

---

## 1. Best Prompts for Updating Docs

### Template
```text
In repo <owner/repo>, on branch <branch>, update <file-path>.

Make only these changes:
- <change 1>
- <change 2>
- <change 3>

Constraints:
- keep the existing structure unless needed
- do not modify unrelated sections
- keep wording concise and consistent with the existing doc

After finishing, verify the write succeeded and report:
- file path
- branch
- commit SHA
```

### Example
```text
In repo mark-mak/my-assistant, on branch dev, update docs/prd-planning.md.

Make only these changes:
- add authentication and login requirements
- add permission control requirements
- add a rule that a family group must always have at least one member

Constraints:
- keep the existing section structure where possible
- renumber functional requirements if needed
- do not modify unrelated requirements

After finishing, verify the write succeeded and report:
- file path
- branch
- commit SHA
```

### Why this works
- It defines the exact target file.
- It limits the scope.
- It requests verification.

---

## 2. Best Prompts for Creating PRDs

### Template
```text
In repo <owner/repo>, on branch <branch>, create <file-path>.

Write a Product Requirements Document for <feature/product>.
Include:
- purpose and scope
- goals
- out of scope
- functional requirements
- defaults and global rules
- acceptance criteria
- open questions
- risks and dependencies

Requirements:
- focus on product behavior, not implementation details
- keep requirements testable and user-facing
- use clear section headings and numbered requirements

After finishing, verify the write succeeded and report:
- file path
- branch
- commit SHA
```

### Example
```text
In repo mark-mak/my-assistant, on branch dev, create docs/prd-family-groups.md.

Write a Product Requirements Document for family group management.
Include:
- purpose and scope
- goals
- out of scope
- functional requirements
- defaults and global rules
- acceptance criteria
- open questions
- risks and dependencies

Requirements:
- focus on user-facing behavior
- include login entry flow, group selection, and group creation
- include the rule that the last member cannot be removed
- keep the document practical for phase 1

After finishing, verify the write succeeded and report:
- file path
- branch
- commit SHA
```

### Why this works
- It gives Copilot a document structure.
- It clarifies what belongs in the PRD.
- It reduces drift into technical design.

---

## 3. Best Prompts for Splitting Files

### Template
```text
In repo <owner/repo>, on branch <branch>, split <source-file> into multiple files under <target-directory>/.

Rules:
- create one file per <unit>
- preserve the original content meaning
- use clear, consistent file names
- create or update an index file at <index-file> linking all generated files
- do not delete the source file unless explicitly asked

After finishing, verify the write succeeded and report:
- all created/updated file paths
- branch
- commit SHA
```

### Example
```text
In repo mark-mak/my-assistant, on branch dev, split docs/story-planning.md into multiple files under docs/story-planning/.

Rules:
- create one file per story
- preserve the original story wording unless a small formatting adjustment is needed
- use clear file names based on story number and title
- create or update docs/story-planning/README.md linking all story files
- keep docs/story-planning.md as the source index document

After finishing, verify the write succeeded and report:
- all created/updated file paths
- branch
- commit SHA
```

### Why this works
- It clearly defines the source, destination, and file organization rules.
- It prevents accidental deletion.
- It asks for a verifiable result.

---

## 4. Best Prompts for Creating GitHub Issues

### Template
```text
Create GitHub issues in repo <owner/repo> based on <source-file or plan>.

Requirements:
- create one issue per <unit>
- each issue must include:
  - title
  - description
  - acceptance criteria
  - dependencies/blockers
  - test notes
- keep each issue small enough for a short iteration
- do not create duplicate issues

After finishing, report:
- issue numbers
- issue titles
- repository
```

### Example
```text
Create GitHub issues in repo mark-mak/my-assistant based on docs/story-planning.md.

Requirements:
- create one issue per story
- each issue must include:
  - title
  - description
  - acceptance criteria
  - dependencies/blockers
  - test notes
- keep each issue implementation-ready
- do not create duplicate issues if equivalent ones already exist

After finishing, report:
- issue numbers
- issue titles
- repository
```

### Why this works
- It tells Copilot how to map planning artifacts into issues.
- It emphasizes non-duplication.
- It defines the output you want back.

---

## 5. Best Prompts for Making Code Changes Safely

### Template
```text
In repo <owner/repo>, on branch <branch>, make only this code change:
<single change request>

Constraints:
- modify only the files required for this change
- do not refactor unrelated code
- preserve existing behavior outside the requested scope
- add or update tests if appropriate
- if the change requires assumptions, state them before writing

After finishing, verify the change and report:
- files changed
- summary of the change
- tests added or updated
- branch
- commit SHA
```

### Example
```text
In repo mark-mak/my-assistant, on branch dev, make only this code change:
Add a guard that prevents removal of the last active member in a family group.

Constraints:
- modify only the files required for this rule
- enforce the rule in backend/domain logic, not UI only
- add or update tests for the blocked last-member case
- do not change unrelated member-management behavior
- if the current membership model is ambiguous, state the assumption before writing code

After finishing, verify the change and report:
- files changed
- summary of the change
- tests added or updated
- branch
- commit SHA
```

### Why this works
- It narrows scope to a single safe change.
- It explicitly blocks unnecessary refactors.
- It asks for assumptions and verification.

---

## Prompt Anti-Patterns to Avoid

Avoid these patterns because they often cause incomplete, ambiguous, or error-prone results.

### 1. Too many actions in one prompt
**Avoid:**
```text
Plan the stories, update the PRD, split the files, and create GitHub issues.
```

**Better:**
```text
Update docs/prd-planning.md on branch dev with the agreed requirements.
```
Then send the next task separately.

### 2. Missing repo / branch / file path
**Avoid:**
```text
Update the planning doc.
```

**Better:**
```text
In repo mark-mak/my-assistant, on branch dev, update docs/story-planning.md.
```

### 3. Asking for broad refactors when you want a small fix
**Avoid:**
```text
Clean up this module and improve member management.
```

**Better:**
```text
In repo mark-mak/my-assistant, on branch dev, add only the validation that blocks removing the last active family member.
```

### 4. No verification requirement
**Avoid:**
```text
Create the file and let me know when done.
```

**Better:**
```text
Create the file, then verify success and report the file path, branch, and commit SHA.
```

### 5. Mixing product design and code implementation in one write request
**Avoid:**
```text
Decide the auth flow, update the PRD, and implement the code.
```

**Better:**
```text
First update docs/prd-planning.md with the auth flow requirements.
```
Then separately:
```text
Implement the login page based on the approved PRD.
```

---

## Recommended Working Style

When working with Copilot on repository tasks, prefer this sequence:

1. Define the exact target: repo, branch, file, or issue scope.
2. Ask for one main action.
3. Add explicit constraints.
4. Ask for verification.
5. Move to the next task only after success is confirmed.

This style is slower per message, but much more reliable across a full implementation workflow.
