class Messrust < Formula
  desc "Mess detector for Rust"
  homepage "https://github.com/quality-gates/messrust"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.5/messrust_0.1.5_darwin_arm64.tar.gz?version=0.1.5"
      sha256 "c13a32ea56bd405bd3ab2ecbc925a8d1df00787077e28fcb30d9dac77d8091c8"
    end

    on_intel do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.5/messrust_0.1.5_darwin_amd64.tar.gz?version=0.1.5"
      sha256 "56f4a5545e2b12144cc7027567b5120341fdd628626890274583d86eede9fff9"
    end
  end

  def install
    bin.install "messrust"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.5", shell_output("#{bin}/messrust --version")
  end
end
