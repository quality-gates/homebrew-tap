# Homebrew tap exploratory pass

## Scope and starting state

The pass used commit `0da12e61efb5d7009334900068704d25eaf7f951` on 2026-11-01. The host was Ubuntu x86_64, without Homebrew or macOS. The worktree was clean before setup. Temporary Ruby packages, release archives, generated formulas, and test output stayed in the worktree. The repository has no dependency lockfile for the Ruby scripts. Ruby 3.3.8 was extracted from Ubuntu packages without a system install.

No processes, browsers, containers, images, volumes, or listening ports were started for this pass. The worktree was the only persistent test resource.

## Results

No product bug was confirmed. The GitHub issue list contained no open or closed issues on 2026-11-01. A search for prior `mutarust` README work found no matching pull requests. [PR 35](https://github.com/quality-gates/homebrew-tap/pull/35) added `mutarust` and recorded a macOS install.

### Install and verify a tool

The goal is to install a tap formula and run its binary. The local attempt was blocked before `brew install` because neither Homebrew nor macOS was available. The shorter command after `brew tap`, a reinstall, and a real user task with an installed binary were not exercised in this pass.

As separate evidence, [the baseline CI run](https://github.com/quality-gates/homebrew-tap/actions/runs/40426939183) passed the install job on macOS 15 and 26, on both Intel and Apple Silicon. Its workflow taps the candidate repository, audits, installs, runs `brew test`, and checks the version of every formula. This is not a substitute for the blocked local journeys. The baseline run skipped the upgrade job because it was a push, not a pull request.

The README lists seven tools but omits `mutarust`, although the formula is present. A reader using the list to discover available tools may miss it. This is a usability observation, not a confirmed install failure.

### Upgrade an installed tool

The goal is to upgrade a previously installed formula after `brew update`. The ordinary path and a no-update retry were blocked by the same missing macOS and Homebrew prerequisites. No local installed state or upgrade effect could be inspected. The baseline CI run did not exercise an upgrade. Upgrade jobs in the report PR are not applicable unless a formula version changes.

### Publish a stable formula

The documented maintainer journey is to rerun the source repository's release workflow with the same tag. That workflow dispatch was not triggered because it can update shared automation branches and pull requests. Instead, the local diagnostic reproduced the formula generation step using immutable release assets and checked the resulting files.

For [messgo v0.5.11](https://github.com/quality-gates/messgo/releases/tag/v0.5.11) and [mutago v2.10.40](https://github.com/quality-gates/mutago/releases/tag/v2.10.40), GitHub reported non-draft, non-prerelease, immutable releases. Both architecture archives passed their published checksums. `script/render-formula` generated files identical to the checked-in formulas, and `script/formula-version` returned the release versions. These checks do not prove that dispatch, protected pull request creation, or retry works end to end.

As an input variation, two fresh output paths received the prerelease version `0.5.11-rc1`. Both calls failed with `invalid stable semantic version` and wrote no formula file. An unknown tool was also rejected. The command transcript is in [release evidence](2026-11-01-homebrew-tap-evidence.txt).

## Verification and limitations

The local Ruby test suite passed with 45 runs and 266 assertions. Its first run had four environment failures because `ruby` was not on `PATH` for subprocesses. Adding the extracted Ruby executable to `PATH` and rerunning fixed the observation setup. This was not classified as a product bug.

The Ruby suite and the formula inventory check are supporting diagnostics, not proof of a user install. The pass did not test macOS installation interactively, upgrade, a source release dispatch, or an installed tool's behavior on a real project. No conclusions are drawn about those paths beyond the linked CI evidence.
