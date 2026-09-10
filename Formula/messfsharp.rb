class Messfsharp < Formula
  desc "Mess detector for F#"
  homepage "https://github.com/quality-gates/messfsharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.4/messfsharp_0.1.4_darwin_arm64.tar.gz?version=0.1.4"
      sha256 "3335fc4709c7998ea474abcf73d78dfcb92354525e2d16ee15258cb6c87dbd56"
    end

    on_intel do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.4/messfsharp_0.1.4_darwin_amd64.tar.gz?version=0.1.4"
      sha256 "63cc5e872fc7367a5b3841c675c495d2dcd7076756be40a7277d76545e6d5d16"
    end
  end

  def install
    bin.install "messfsharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.4", shell_output("#{bin}/messfsharp --version")
  end
end
