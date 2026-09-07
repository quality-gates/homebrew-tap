class Messharp < Formula
  desc "Mess detector for C#"
  homepage "https://github.com/quality-gates/messharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.6/messharp_0.2.6_darwin_arm64.tar.gz?version=0.2.6"
      sha256 "1ba25312f2737c2a70c920e60d5e15a7c20ea2e66f3acfd6c1a6148f5875cf6e"
    end

    on_intel do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.6/messharp_0.2.6_darwin_amd64.tar.gz?version=0.2.6"
      sha256 "67dca0b7f80b4a7261b20833f9410a21d72d5ff391bcce707eac5fe3e1647ebf"
    end
  end

  def install
    bin.install "messharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.6", shell_output("#{bin}/messharp --version")
  end
end
