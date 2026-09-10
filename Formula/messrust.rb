class Messrust < Formula
  desc "Mess detector for Rust"
  homepage "https://github.com/quality-gates/messrust"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.8/messrust_0.1.8_darwin_arm64.tar.gz?version=0.1.8"
      sha256 "a7c82fad39d2704a784e0e8a1d345f7d9426b334b8f612ab7baeacd8b6c288db"
    end

    on_intel do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.8/messrust_0.1.8_darwin_amd64.tar.gz?version=0.1.8"
      sha256 "e0df8851b97ffd8eac2c2795dee2d9476a1f6322351f2de74370e570282cce84"
    end
  end

  def install
    bin.install "messrust"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.8", shell_output("#{bin}/messrust --version")
  end
end
