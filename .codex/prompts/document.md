---
description: Generate user-facing project documentation from current sources
argument-hint: MODE=all|readme-only|changelog-only|api-docs
---
<!-- document prompt: synthesizes README, changelog, and docs from code + history -->
1. Resolve execution mode:
   - Set `MODE=${MODE:-all}` and ensure it is one of `all`, `readme-only`, `changelog-only`, or `api-docs`.
   - Collect repository metadata (language, package managers, existing docs) before writing files.
2. Gather inputs:
   - Parse manifests (`package.json`, `Cargo.toml`, `go.mod`, `deno.json`), build scripts, configuration files, and git history.
   - Detect frameworks, CLI commands, API specs (OpenAPI, proto, GraphQL), and environment variables.
3. README generation (if enabled):
   - Compose sections for overview, installation, usage, development workflow, testing commands, and contribution notes.
   - Include detected badges and highlight key configuration snippets; preserve existing custom templates when present.
4. Changelog generation (if enabled):
   - Analyze conventional commits and tags to build release notes with features, fixes, breaking changes, and contributor attributions.
   - Anchor entries with dates and relevant issue or PR references.
5. API and configuration docs (if enabled):
   - Emit markdown under `docs/` describing endpoints, message types, auth flows, environment variables, and runtime configuration.
   - Provide example requests/responses, note required tooling or setup steps, and mention template customization options when they exist.
6. Quality and maintenance:
   - Validate markdown structure, verify links, and ensure accessibility basics (alt text placeholders, readable headings).
   - Summarize generated artifacts to the user, suggest follow-up reviews, and remind them to commit updates once verified.
   - Reference the official custom-command guide for formatting expectations and call out supported frameworks, templates, and CI integrations when relevant.
