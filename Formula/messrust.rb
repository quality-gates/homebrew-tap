class Messrust < Formula
  desc "Mess detector for Rust"
  homepage "https://github.com/quality-gates/messrust"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.15/messrust_0.1.15_darwin_arm64.tar.gz?version=0.1.15"
      sha256 "41aedc71d1a84eacb7f9304c1a2f3faab6f9abd335bae57a8a7bf8a09ba24a3a"
    end

    on_intel do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.15/messrust_0.1.15_darwin_amd64.tar.gz?version=0.1.15"
      sha256 "f9c3a4ec14195cd099703d239df1916467ab0b2e9cbe1294c0d1215926c5e04c"
    end
  end

  def install
    bin.install "messrust"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.15", shell_output("#{bin}/messrust --version")
  end
end
