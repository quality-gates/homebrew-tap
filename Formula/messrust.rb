class Messrust < Formula
  desc "Mess detector for Rust"
  homepage "https://github.com/quality-gates/messrust"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.0/messrust_0.1.0_darwin_arm64.tar.gz"
      sha256 "e61466561fc04bd6529725150013fc2d1d78f1a5a62068c5dc38ad0134faa6ef"
    end

    on_intel do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.0/messrust_0.1.0_darwin_amd64.tar.gz"
      sha256 "1409b47530115673e5187ec9b9e6d022022af8cc34f8c42ef72b801e1c86e19f"
    end
  end

  def install
    bin.install "messrust"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/messrust --version")
  end
end
