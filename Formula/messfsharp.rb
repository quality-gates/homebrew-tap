class Messfsharp < Formula
  desc "Mess detector for F#"
  homepage "https://github.com/quality-gates/messfsharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.5/messfsharp_0.1.5_darwin_arm64.tar.gz?version=0.1.5"
      sha256 "10763962ea3c69947ca76d424f4027e3230000578812fa641c1d955bc77d0f9c"
    end

    on_intel do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.5/messfsharp_0.1.5_darwin_amd64.tar.gz?version=0.1.5"
      sha256 "28575552a48bf4014a1d639938903e240f8999437ace22bf66231d281dedb577"
    end
  end

  def install
    bin.install "messfsharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.5", shell_output("#{bin}/messfsharp --version")
  end
end
