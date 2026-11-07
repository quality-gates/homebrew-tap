class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.42/mutago_2.10.42_darwin_arm64.tar.gz?version=2.10.42"
      sha256 "e98553de43314af5273d2d1bd6d6fd641c259769187506debcf410d77a48a531"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.42/mutago_2.10.42_darwin_amd64.tar.gz?version=2.10.42"
      sha256 "19a908df98adbb6cd254b09639427d3ecda17d1458d89de9f2e5a7a8387b23d1"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.42", shell_output("#{bin}/mutago --version")
  end
end
