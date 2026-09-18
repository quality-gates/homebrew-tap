class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.15/mutago_2.10.15_darwin_arm64.tar.gz?version=2.10.15"
      sha256 "d124eb75d53701368c874ea28e92f87bb21f8001756dd16296cbac021c7a23bd"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.15/mutago_2.10.15_darwin_amd64.tar.gz?version=2.10.15"
      sha256 "539495c3040214772e7104b5a9f81a60b89f77b3f34620e710a834985cb240f5"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.15", shell_output("#{bin}/mutago --version")
  end
end
