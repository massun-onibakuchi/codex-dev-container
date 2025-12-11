---
description: Build tests in phased increments with user checkpoints
argument-hint: TARGET=<module or behavior under test>
---

<!-- test prompt: expands coverage from smoke tests to advanced scenarios -->

1. Confirm scope and prerequisites:
   - Clarify the system under test, existing frameworks, fixtures, and acceptance criteria from `TARGET` or follow-up questions.
   - Verify the workspace is ready (dependencies installed, test runner available) before generating code.
2. Phase 1 – Foundation suite:
   - Author 3–5 focused unit tests covering the happy path, basic error handling, and representative negative cases.
   - Use the Arrange-Act-Assert pattern, import the correct test libraries, and keep data fixtures close to the tests.
   - Present the tests and ask the user to confirm they run as expected before continuing.
3. Phase 2 – Expanded coverage (after approval):
   - Add edge cases (empty, null, boundary inputs), additional failure scenarios, and integration points where relevant.
   - Refactor common setup into reusable helpers while avoiding opaque abstractions.
   - Pause for user review and confirmation again.
4. Phase 3 – Advanced safeguards (after second approval):
   - Introduce property-based, stress, security, or concurrency tests that suit the target domain.
   - Capture metrics or timing assertions if performance regressions are a risk.
5. Quality checks across all phases:
   - Keep assertions expressive, add brief comments only where logic is non-obvious, and ensure no duplicate coverage.
   - Avoid duplicating tests; use reusable helpers or parameterized suites when scenarios overlap.
   - Update or create documentation snippets describing how to run the new tests and what they validate.
   - Offer to run the suite (or provide commands) so the user can verify locally before final sign-off.
   - Remember quality beats volume—prioritize a small number of dependable tests over a large brittle set.
