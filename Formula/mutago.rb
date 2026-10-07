class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.23/mutago_2.10.23_darwin_arm64.tar.gz?version=2.10.23"
      sha256 "57f413eb6d228c78e2a11687b2e3a4cea528f0e3b3f6e8dc2f89d7ab1031d1dd"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.23/mutago_2.10.23_darwin_amd64.tar.gz?version=2.10.23"
      sha256 "9ee3e5fb71e30c7530bd997081696f9cca133d6568503766cc6c594f75e07b2a"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.23", shell_output("#{bin}/mutago --version")
  end
end
