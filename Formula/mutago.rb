class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.22/mutago_2.10.22_darwin_arm64.tar.gz?version=2.10.22"
      sha256 "3642559c8e01506c192be93776d7d24361c344cdf7486404d0b6d1eff5225837"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.22/mutago_2.10.22_darwin_amd64.tar.gz?version=2.10.22"
      sha256 "9c5e31b76f6cedcbb2851e4ddded9450e4999923bd6aaeb71b4f261ae80a4474"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.22", shell_output("#{bin}/mutago --version")
  end
end
