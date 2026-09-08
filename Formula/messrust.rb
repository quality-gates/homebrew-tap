class Messrust < Formula
  desc "Mess detector for Rust"
  homepage "https://github.com/quality-gates/messrust"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.6/messrust_0.1.6_darwin_arm64.tar.gz?version=0.1.6"
      sha256 "9fc7fbc705e0179e523817cc2e2a5b5d99e0a398f7c40bcb83c13f9c0eb21692"
    end

    on_intel do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.6/messrust_0.1.6_darwin_amd64.tar.gz?version=0.1.6"
      sha256 "e63145aa7988c3d4f54b936287f1f5ac29877249a9ecf8dcb3c4d2a3fd349d05"
    end
  end

  def install
    bin.install "messrust"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.6", shell_output("#{bin}/messrust --version")
  end
end
