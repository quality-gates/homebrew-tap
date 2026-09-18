class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.14/mutago_2.10.14_darwin_arm64.tar.gz?version=2.10.14"
      sha256 "7e7ae2fc46b66b4cd8034cdc28339c46952123f5d7c568e947f52fb0a971abba"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.14/mutago_2.10.14_darwin_amd64.tar.gz?version=2.10.14"
      sha256 "528dfac4d72673152ca34df918b9d2a991d029d49bb5962985f119115f87a25f"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.14", shell_output("#{bin}/mutago --version")
  end
end
