class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.31/mutago_2.10.31_darwin_arm64.tar.gz?version=2.10.31"
      sha256 "e0764918e47e355a7d07579f1b77114eda69bf19b5ab89232d2a25aff8294c6a"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.31/mutago_2.10.31_darwin_amd64.tar.gz?version=2.10.31"
      sha256 "f8f2b577567f2edb381c58fcd5aa2d2048ce2f0d49e36ea7a19a03d622c487e0"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.31", shell_output("#{bin}/mutago --version")
  end
end
