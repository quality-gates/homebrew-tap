class Messfsharp < Formula
  desc "Mess detector for F#"
  homepage "https://github.com/quality-gates/messfsharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.6/messfsharp_0.1.6_darwin_arm64.tar.gz?version=0.1.6"
      sha256 "8c8927652330c6c5b0c02fa2302e7ee640873c01c4e138142b3b5a7838b96496"
    end

    on_intel do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.6/messfsharp_0.1.6_darwin_amd64.tar.gz?version=0.1.6"
      sha256 "9c4e1080bdac3261cb8f179dcba65195334066280cec62f455b95e078c74d17c"
    end
  end

  def install
    bin.install "messfsharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.6", shell_output("#{bin}/messfsharp --version")
  end
end
