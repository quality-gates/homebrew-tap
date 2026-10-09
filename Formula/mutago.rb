class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.26/mutago_2.10.26_darwin_arm64.tar.gz?version=2.10.26"
      sha256 "c9406d05e612e2f902315e8746e8d62c1bc8220634473f6bd25f8049ecfb5324"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.26/mutago_2.10.26_darwin_amd64.tar.gz?version=2.10.26"
      sha256 "34cc483cb35103d783d59a2851b39bf88644b812a35dae9eb5a0d67cb1eeed8a"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.26", shell_output("#{bin}/mutago --version")
  end
end
