#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

required_files=(
  "README.md"
  "docs/frontend-architecture.md"
  "docs/prd-planning.md"
  "docs/harness-ci-setup.md"
  ".harness/repo_hygiene.yaml"
)

required_directories=(
  "docs"
  "scripts"
  ".harness"
)

markdown_files=(
  "README.md"
  "docs/frontend-architecture.md"
  "docs/prd-planning.md"
  "docs/harness-ci-setup.md"
)

expect_app_scaffold="${EXPECT_APP_SCAFFOLD:-false}"
app_scaffold_files=(
  "package.json"
  "src"
)

fail() {
  echo "ERROR: $*" >&2
  exit 1
}

assert_exists() {
  local path="$1"
  [[ -e "${REPO_ROOT}/${path}" ]] || fail "Required path is missing: ${path}"
}

assert_non_empty_file() {
  local path="$1"
  [[ -s "${REPO_ROOT}/${path}" ]] || fail "Required file is empty: ${path}"
}

assert_markdown_heading() {
  local path="$1"
  local first_non_empty_line

  first_non_empty_line="$(
    awk 'NF { print; exit }' "${REPO_ROOT}/${path}"
  )"

  [[ "${first_non_empty_line}" =~ ^#\  ]] || fail "Markdown file must start with a level-1 heading: ${path}"
}

assert_markdown_sections() {
  local path="$1"

  grep -q '^## ' "${REPO_ROOT}/${path}" || fail "Markdown file must include at least one level-2 section: ${path}"
}

assert_no_trailing_whitespace() {
  local path="$1"

  if grep -n '[[:blank:]]$' "${REPO_ROOT}/${path}" >/dev/null; then
    fail "Trailing whitespace detected in ${path}"
  fi
}

echo "Validating required repository paths..."

for path in "${required_directories[@]}"; do
  assert_exists "${path}"
done

for path in "${required_files[@]}"; do
  assert_exists "${path}"
done

echo "Validating required repository files..."

for path in "${required_files[@]}"; do
  assert_non_empty_file "${path}"
done

echo "Validating markdown structure..."

for path in "${markdown_files[@]}"; do
  assert_non_empty_file "${path}"
  assert_markdown_heading "${path}"
  assert_no_trailing_whitespace "${path}"
done

for path in \
  "docs/frontend-architecture.md" \
  "docs/prd-planning.md" \
  "docs/harness-ci-setup.md"; do
  assert_markdown_sections "${path}"
done

echo "Validating repository shape for the current planning phase..."

if [[ ! -d "${REPO_ROOT}/docs" ]]; then
  fail "Expected docs/ directory for the planning phase"
fi

if [[ "${expect_app_scaffold}" == "true" ]]; then
  echo "EXPECT_APP_SCAFFOLD=true, validating future application files..."
  for path in "${app_scaffold_files[@]}"; do
    assert_exists "${path}"
  done
else
  echo "Application scaffold checks are disabled for the current repo phase."
fi

echo "Repository validation passed."
