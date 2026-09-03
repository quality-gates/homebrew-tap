class Messfsharp < Formula
  desc "Mess detector for F#"
  homepage "https://github.com/quality-gates/messfsharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.1/messfsharp_0.1.1_darwin_arm64.tar.gz?version=0.1.1"
      sha256 "00839efd99b692e970507f3c98ccdc7607338f876fbdae8b0d1a67386599d318"
    end

    on_intel do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.1/messfsharp_0.1.1_darwin_amd64.tar.gz?version=0.1.1"
      sha256 "27a3b29bcc0566b100f4a475c3858b079aeb420f4c6776f1ab7cd5aa1e6238cd"
    end
  end

  def install
    bin.install "messfsharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/messfsharp --version")
  end
end
