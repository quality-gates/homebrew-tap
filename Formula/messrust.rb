class Messrust < Formula
  desc "Mess detector for Rust"
  homepage "https://github.com/quality-gates/messrust"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.12/messrust_0.1.12_darwin_arm64.tar.gz?version=0.1.12"
      sha256 "7440dfc1b1d1022ed94d57a31b811d5c65851f3b476025ec4534a405cebee4f8"
    end

    on_intel do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.12/messrust_0.1.12_darwin_amd64.tar.gz?version=0.1.12"
      sha256 "a03b7330defba03887708ba10b7077d0e6ea300c9e60f44e796cd932c230252a"
    end
  end

  def install
    bin.install "messrust"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.12", shell_output("#{bin}/messrust --version")
  end
end
