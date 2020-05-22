#!/bin/sh

cd "$GITHUB_WORKSPACE"
export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

git ls-files --exclude='Dockerfile*' --ignored | xargs hadolint \
  | reviewdog -efm="%f:%l %m" \
    -name="${INPUT_TOOL_NAME}" \
    -reporter="${INPUT_REPORTER}" \
    -filter-mode="${INPUT_FILTER_MODE}" \
    -fail-on-error="${INPUT_FAIL_ON_ERROR}" \
    -level="${INPUT_LEVEL}" \
    ${INPUT_REVIEWDOG_FLAGS}
