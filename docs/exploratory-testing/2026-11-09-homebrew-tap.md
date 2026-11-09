# Homebrew tap exploratory pass

## Starting state

On 2026-11-09, the pass used `3bd0d10ff8645a383391e2341be1931b9db933d5` in a clean worktree based on `origin/main`. The host was Ubuntu x86_64. Neither macOS nor Homebrew was available. The repository has no Ruby dependency lockfile. Ruby 3.3.8 and Minitest came from Ubuntu packages extracted inside the worktree, without a system install. Temporary files and downloads stayed in the worktree. No background processes, browsers, containers, images, volumes, or listening ports were started.

The [command transcript](2026-11-09-homebrew-tap-evidence.txt) records the observed output. GitHub Actions also ran the unchanged install matrix on [the baseline commit](https://github.com/quality-gates/homebrew-tap/actions/runs/42418239860). Those jobs are supporting evidence, not a local interactive install.

## Confirmed finding

[Issue 179](https://github.com/quality-gates/homebrew-tap/issues/179) records that `Formula/mutarust.rb` points to the stable `v0.1.4` release, which GitHub reports as mutable. The README and coding standards promise immutable releases. Two API queries returned `immutable: false`. The other seven current formula releases returned `immutable: true`.

A mutable release can be changed or removed, which can make a later install unavailable. The checked-in SHA-256 values still reject changed archive bytes. Both current archives matched those values in this pass, so this is not evidence of a checksum bypass or an install failure. The later `v0.2.1` release had no assets when inspected, so it is not an established replacement. The report leaves the product fix to the issue worker.

## Journeys

### Install a tool

The goal was to install `mutago` from the tap and run its binary. The documented direct command and the `brew tap` variation each stopped with `brew: command not found`. The shorter install command after tapping and a task with the installed binary were therefore not exercised. No installed state was created. This is a host prerequisite, not a confirmed tap defect.

As a separate release check, both `mutago` 2.10.42 macOS archives downloaded successfully. Their published checksums matched the downloads, the formula hashes matched the downloads, and each archive contained `mutago` and `LICENSE`. These checks do not establish that Homebrew installs or runs the binaries.

### Upgrade an installed tool

The goal was to run `brew update` and upgrade an installed tool. Both commands stopped with `brew: command not found`. A retry with no new version and the resulting installed version could not be checked. No local upgrade conclusion is possible. The baseline push run does not exercise a pull request upgrade. The earlier [mutago update PR](https://github.com/quality-gates/homebrew-tap/pull/178) has passing upgrade jobs for that specific update, not for this local journey.

### Publish a stable formula

The maintainer goal was to publish a formula for an immutable stable release and safely retry it. The documented source release workflow was not dispatched because it would mutate shared automation branches or pull requests. This pass instead exercised its local generation step with real release downloads. It generated `mutago` 2.10.42 and `mutarust` 0.1.4 formulas byte-for-byte identical to the checked-in files. Rendering `mutago` again to the same path produced the same file. The publication workflow separately requires an immutable release. Successful local rendering does not show that the workflow would accept the mutable `mutarust` release, or that dispatch and pull request creation work.

As a variation, the generator rejected `2.10.42-rc1` twice from fresh output paths. Both attempts exited with an error and created no file. GitHub reported the `mutago` release immutable, but reported the `mutarust` release mutable, as described in issue 179.

## Other observations and limits

The README lists seven installable tools but omits `mutarust`. The [previous pass](2026-11-01-homebrew-tap.md) recorded the same discovery problem. This remains a usability observation, not a newly filed install defect. The earlier CI trust failure, [issue 165](https://github.com/quality-gates/homebrew-tap/issues/165), is closed by [PR 166](https://github.com/quality-gates/homebrew-tap/pull/166). No open issue or pull request claimed the mutable-release finding before issue 179 was filed.

The Ruby suite passed with 48 runs, 306 assertions, and no failures, errors, or skips. The formula inventory check also passed. These diagnostics are not substitutes for a native macOS install or upgrade. No unresolved product failures were observed beyond the confirmed issue. Source release dispatch, installed tool behavior, and real local upgrades remain unexplored.
