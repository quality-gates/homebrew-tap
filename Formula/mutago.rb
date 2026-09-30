class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.19/mutago_2.10.19_darwin_arm64.tar.gz?version=2.10.19"
      sha256 "93246317b725dc470d559e4ca33475353a59d481c156f4d2985f81530900face"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.19/mutago_2.10.19_darwin_amd64.tar.gz?version=2.10.19"
      sha256 "035f289724a00b0672678769cc771523637440cf2e43cba43e46ef9c10784988"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.19", shell_output("#{bin}/mutago --version")
  end
end
