class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.21/mutago_2.10.21_darwin_arm64.tar.gz?version=2.10.21"
      sha256 "f0af986cdd48afb6d6a04f951597d5e92c2c0d7e388798699481e5587240c28b"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.21/mutago_2.10.21_darwin_amd64.tar.gz?version=2.10.21"
      sha256 "3041d64aa6945d338f92a5ea199d21827ce6cacc092adf41dc25f02eb9bb749a"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.21", shell_output("#{bin}/mutago --version")
  end
end
