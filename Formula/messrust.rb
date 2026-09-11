class Messrust < Formula
  desc "Mess detector for Rust"
  homepage "https://github.com/quality-gates/messrust"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.9/messrust_0.1.9_darwin_arm64.tar.gz?version=0.1.9"
      sha256 "d9aa39131b9968f993fd7bb7cc9fd84bd4817f1458fc8165359c87a46a3e9cd9"
    end

    on_intel do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.9/messrust_0.1.9_darwin_amd64.tar.gz?version=0.1.9"
      sha256 "c67803aba0e45e14d2c4f49a105d3cf5588075497dde9ec6c49545f1b34d6e77"
    end
  end

  def install
    bin.install "messrust"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.9", shell_output("#{bin}/messrust --version")
  end
end
