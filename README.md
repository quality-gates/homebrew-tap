# quality-gates Homebrew tap

This tap distributes stable, immutable releases of the `quality-gates` mess
detectors.

## Install

Install any CLI directly from the tap:

```bash
brew install quality-gates/tap/messcript
brew install quality-gates/tap/messfsharp
brew install quality-gates/tap/messgo
brew install quality-gates/tap/messharp
brew install quality-gates/tap/messpy
brew install quality-gates/tap/messrust
```

After `brew tap quality-gates/tap`, the shorter form also works:

```bash
brew install messcript messfsharp messgo messharp messpy messrust
```

Upgrade installed tools with `brew update` followed by `brew upgrade <tool>`.

Each formula is generated from a stable `vMAJOR.MINOR.PATCH` release. The
archive selected for the host architecture is pinned by its SHA-256 checksum.
Formula updates arrive through protected pull requests; the tap does not accept
formula content or download URLs from dispatch callers.

## Maintainers

The `Publish mess formula` workflow records the exact release identity and
deterministic automation branch. Rerun a source repository's `Release` workflow
with the same tag to redispatch a failed publication. Do not delete or change a
valid immutable GitHub release to recover a tap failure.
