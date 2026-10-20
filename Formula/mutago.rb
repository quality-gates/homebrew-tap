class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.35/mutago_2.10.35_darwin_arm64.tar.gz?version=2.10.35"
      sha256 "ca294dcdbb937d1186e44d553967b5dde48a0ec82922799c281580b592027777"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.35/mutago_2.10.35_darwin_amd64.tar.gz?version=2.10.35"
      sha256 "9e655d873b465d4e71ce3569d7f48b30f03013f51d9d0de62f13545964e8a81e"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.35", shell_output("#{bin}/mutago --version")
  end
end
