# Harness CI Setup

## Goal

This repository is currently a planning/docs repository, so the initial Harness CI pipeline validates repository hygiene instead of application build output.

## Repository CI assets

- Harness pipeline definition: `/home/runner/work/my-assistant/my-assistant/.harness/repo_hygiene.yaml`
- Local validation script: `/home/runner/work/my-assistant/my-assistant/scripts/validate-repo.sh`

## What the baseline pipeline checks

1. Required planning documents exist.
2. Required repo directories exist.
3. Markdown files are non-empty and start with a level-1 heading.
4. Core planning docs include level-2 sections.
5. Markdown files do not contain trailing whitespace.
6. Future application scaffold checks can be enabled later with `EXPECT_APP_SCAFFOLD=true`.

## Harness setup steps for this repo

### 1. Add the GitHub repository

1. Create or reuse a GitHub connector in Harness with access to `mark-mak/my-assistant`.
2. Import `/home/runner/work/my-assistant/my-assistant/.harness/repo_hygiene.yaml` as a CI pipeline.
3. Provide the `codebase_connector` pipeline variable with the GitHub connector reference.

### 2. Configure the container image connector

1. Create or reuse a Docker-compatible connector for public container image pulls.
2. Provide that connector reference through the `container_connector` pipeline variable.

### 3. Enable triggers

Configure the following triggers in Harness:

1. **Pull request trigger**
   - Run the `repo_hygiene` pipeline for every PR opened or updated against the default branch.
2. **Push trigger**
   - Run the same pipeline for pushes to the default branch.
3. **Manual trigger**
   - Keep manual execution enabled for maintainers.

## Secrets and connectors

- Use a GitHub connector for repository access and commit status reporting.
- Store any GitHub token or webhook secret in Harness Secret Manager.
- No deployment connectors or runtime secrets are required yet.

## Local validation

Run the same repository checks locally:

```bash
/home/runner/work/my-assistant/my-assistant/scripts/validate-repo.sh
```

When the application scaffold is added later, enable the future-file checks:

```bash
EXPECT_APP_SCAFFOLD=true /home/runner/work/my-assistant/my-assistant/scripts/validate-repo.sh
```

## Next revision point

Once the React/Vite/TypeScript app scaffold exists, expand the Harness pipeline with dependency install, lint, type-check, tests, and production build stages.
