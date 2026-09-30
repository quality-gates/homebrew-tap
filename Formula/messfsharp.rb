class Messfsharp < Formula
  desc "Mess detector for F#"
  homepage "https://github.com/quality-gates/messfsharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.12/messfsharp_0.1.12_darwin_arm64.tar.gz?version=0.1.12"
      sha256 "191b6e5583c674ca499dcd8a065bd71e12523717329cebc2b447fb5280ee4174"
    end

    on_intel do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.12/messfsharp_0.1.12_darwin_amd64.tar.gz?version=0.1.12"
      sha256 "3231a895b7441ebaeee2f578a76c053cb8db037e0d8962d86262a8c8b9db16f4"
    end
  end

  def install
    bin.install "messfsharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.12", shell_output("#{bin}/messfsharp --version")
  end
end
