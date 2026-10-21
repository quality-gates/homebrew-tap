class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.37/mutago_2.10.37_darwin_arm64.tar.gz?version=2.10.37"
      sha256 "0b3ed62899ba8b73efb398e3f6305500ff375ea5d7ab07d4a90195c40a89c536"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.37/mutago_2.10.37_darwin_amd64.tar.gz?version=2.10.37"
      sha256 "7c629c48483dd538032758466e8d74156c7f36bb522fb1c83b8a531d11e1c0d2"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.37", shell_output("#{bin}/mutago --version")
  end
end
