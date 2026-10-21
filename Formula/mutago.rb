class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.36/mutago_2.10.36_darwin_arm64.tar.gz?version=2.10.36"
      sha256 "a06408b5ede6a4352b16196d58e8d4d5eb556f65cf9efe87f958ae852dd7e504"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.36/mutago_2.10.36_darwin_amd64.tar.gz?version=2.10.36"
      sha256 "2844bf003bb8c9b44d00977922a33906a0b2ea0b140e550246d35f6747d09636"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.36", shell_output("#{bin}/mutago --version")
  end
end
