#!/bin/bash
# Local publish trigger script
# This uses the GitHub CLI to trigger the workflow

set -e

VERSION_BUMP="${1:-patch}"

if ! command -v gh &> /dev/null; then
    echo "Error: GitHub CLI (gh) is not installed"
    echo "Install it with: brew install gh"
    exit 1
fi

if ! gh auth status &> /dev/null; then
    echo "Error: Not authenticated with GitHub CLI"
    echo "Run: gh auth login"
    exit 1
fi

echo "Triggering publish workflow with version bump: $VERSION_BUMP"
gh workflow run publish.yml -f version_bump="$VERSION_BUMP"

echo ""
echo "Workflow triggered! Check status with:"
echo "  gh run list --workflow=publish.yml"
echo ""
echo "Or watch the run:"
echo "  gh run watch"

