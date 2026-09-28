class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.17/mutago_2.10.17_darwin_arm64.tar.gz?version=2.10.17"
      sha256 "014fb10a33a059e2221333f47203640a71fdec281cedb03dbb09ab3be4af94cd"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.17/mutago_2.10.17_darwin_amd64.tar.gz?version=2.10.17"
      sha256 "410625c5ed41a6904f0800dd7a1740d611e4a0c87ae7c4563c93ff3c4f84660e"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.17", shell_output("#{bin}/mutago --version")
  end
end
