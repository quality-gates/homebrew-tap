class Messfsharp < Formula
  desc "Mess detector for F#"
  homepage "https://github.com/quality-gates/messfsharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.18/messfsharp_0.1.18_darwin_arm64.tar.gz?version=0.1.18"
      sha256 "c7f540acecc006ebd078f4c8c760c24abcbd52802c061c77b7d90733b1e7f765"
    end

    on_intel do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.18/messfsharp_0.1.18_darwin_amd64.tar.gz?version=0.1.18"
      sha256 "27e5b95550035aae221e76db0dd27df093700c7740dfc70b5b1a4ce569dcae6d"
    end
  end

  def install
    bin.install "messfsharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.18", shell_output("#{bin}/messfsharp --version")
  end
end
