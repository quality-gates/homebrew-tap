class Messharp < Formula
  desc "Mess detector for C#"
  homepage "https://github.com/quality-gates/messharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.5/messharp_0.2.5_darwin_arm64.tar.gz?version=0.2.5"
      sha256 "8c25ccc04e0291f5e95767afdfae9ffa56da92b7312829729a825b6eedca58c1"
    end

    on_intel do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.5/messharp_0.2.5_darwin_amd64.tar.gz?version=0.2.5"
      sha256 "278d707aba130cdf443d67077ea00aee96e7fcbbfb85fb0da2c5cc443d07427d"
    end
  end

  def install
    bin.install "messharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.5", shell_output("#{bin}/messharp --version")
  end
end
