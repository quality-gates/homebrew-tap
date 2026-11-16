class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.43/mutago_2.10.43_darwin_arm64.tar.gz?version=2.10.43"
      sha256 "969d10d5263574bd79bae85ab98c4da8c3cb2289e4a5749fa57cd15d2f04a538"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.43/mutago_2.10.43_darwin_amd64.tar.gz?version=2.10.43"
      sha256 "1b27dcfaea46a1d472292ad148e167164acc0cfebea0bb0c0e774910841f66bc"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.43", shell_output("#{bin}/mutago --version")
  end
end
