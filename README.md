# quality-gates Homebrew tap

This tap distributes stable, immutable releases from
[`quality-gates/messgo`](https://github.com/quality-gates/messgo).

## Install

```bash
brew install quality-gates/tap/messgo
```

Upgrade to the latest stable release with:

```bash
brew update
brew upgrade quality-gates/tap/messgo
```

The formula is generated from a stable `vMAJOR.MINOR.PATCH` messgo release.
Each release archive is selected for the host architecture and pinned by its
SHA-256 checksum. Formula updates arrive through a protected pull request; the
tap never accepts formula content or download URLs from the dispatch caller.

## Maintainers

See a failed `Publish messgo formula` workflow for the exact release identity
and deterministic automation branch. Rerunning the source repository's
`Release` workflow with the same tag safely redispatches publication. A valid
immutable GitHub release must not be deleted or changed to recover a tap
failure.
