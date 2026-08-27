class Messrust < Formula
  desc "Mess detector for Rust"
  homepage "https://github.com/quality-gates/messrust"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.2/messrust_0.1.2_darwin_arm64.tar.gz?version=0.1.2"
      sha256 "a638563718222139fdd3991d669efd6ba6ee70f3ff4643a078d3d3b06703b221"
    end

    on_intel do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.2/messrust_0.1.2_darwin_amd64.tar.gz?version=0.1.2"
      sha256 "b9c0d899cbd7bbe62d0dabb74b961e5adc96ed6f226f8686f6768a8ee3080478"
    end
  end

  def install
    bin.install "messrust"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.2", shell_output("#{bin}/messrust --version")
  end
end
