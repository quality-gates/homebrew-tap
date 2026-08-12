# Coding standards

## Tests

- Strongly prefer integration tests and end-to-end tests over unit tests.
- Strongly prefer exercising real system behaviour over "the tests pass so it must work."
- Only mock third-party services we cannot control. Do not mock code we own.
- For this codebase, the default proof is: exercise formula generation / tap workflows against a real immutable release identity and verify URL, version, and checksum behaviour — not hand-waved “the workflow file looks right.”

## Comments and docs

- Code comments use ASD-STE100 Simplified Technical English.
- Ground terms in `CONTEXT.md` domain language when that file exists. Do not invent synonyms for glossary terms.
- Do not write comments that only repeat what the code already makes clear.
- Do not put brittle references in README or comments (versions, line numbers, temporary paths, "as of today" claims) when those details are allowed to change. Pin release identity in formulas via version + SHA-256, not prose.

## Common footguns

- Tautological tests (asserting the mock was called the way the test just configured it).
- Mocks of modules/services we own.
- "Green suite" treated as proof the product works for a user.
- Narrating comments and README drift magnets.
- Cheating complexity or quality gates with denser syntax, hidden branching, or indirection that does not reduce real complexity.
- Accepting formula body, bottles, or download URLs from an untrusted dispatch caller.

## Homebrew tap

- This tap publishes **stable, immutable** `vMAJOR.MINOR.PATCH` releases only. No prerelease or build-suffix formulas.
- Every bottle/archive URL must be pinned by SHA-256 for the host architecture. Never land an unpinned URL.
- Formula updates arrive through protected pull requests produced by the trusted automation path. Do not hand-edit production formulas to “hotfix” a bad release by rewriting history of an immutable tag.
- Do not delete or mutate a published GitHub release to recover a tap failure; fix forward with a new release or a correct formula PR.
- Keep scripts under `script/` deterministic and rerunnable with the same release identity.
- Tests under `test/` should assert formula content and checksum wiring against known release fixtures where possible.
- Ruby in this repo stays small and boring: clear methods, no metaprogramming tricks, no network calls at formula *load* time beyond what Homebrew already does for fetch.
