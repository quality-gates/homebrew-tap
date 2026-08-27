class Messfsharp < Formula
  desc "Mess detector for F#"
  homepage "https://github.com/quality-gates/messfsharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.0/messfsharp_0.1.0_darwin_arm64.tar.gz?version=0.1.0"
      sha256 "ffe28467034e18d89c052ffe94eafe451e78a2491ad3e94f87ebe4e4b896af36"
    end

    on_intel do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.0/messfsharp_0.1.0_darwin_amd64.tar.gz?version=0.1.0"
      sha256 "823855f84f467dfcdc4d9e6065997702a0e7b807389bbe0ae30a4245c4ca93ba"
    end
  end

  def install
    bin.install "messfsharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/messfsharp --version")
  end
end
