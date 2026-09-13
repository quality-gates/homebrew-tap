class Messharp < Formula
  desc "Mess detector for C#"
  homepage "https://github.com/quality-gates/messharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.14/messharp_0.2.14_darwin_arm64.tar.gz?version=0.2.14"
      sha256 "01d1c4f0d0696a9037187b755af48cee751483680196ce88f6120951d0d4d69c"
    end

    on_intel do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.14/messharp_0.2.14_darwin_amd64.tar.gz?version=0.2.14"
      sha256 "dace2fc666d07e5d9b5d6c09fce0ca33bd70b76cfc77103400080282d6bd2172"
    end
  end

  def install
    bin.install "messharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.14", shell_output("#{bin}/messharp --version")
  end
end
