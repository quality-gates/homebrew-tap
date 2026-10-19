class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.32/mutago_2.10.32_darwin_arm64.tar.gz?version=2.10.32"
      sha256 "bca95732773e2c9f1fc85e6dbe2ebe2520e1a7e698c186fc55c1ca91faa52613"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.32/mutago_2.10.32_darwin_amd64.tar.gz?version=2.10.32"
      sha256 "d70c3113892f1c6dcd747f55e17765327217c927a59a6e48f8a6b9d20d448e06"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.32", shell_output("#{bin}/mutago --version")
  end
end
