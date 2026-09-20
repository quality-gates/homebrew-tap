class Messharp < Formula
  desc "Mess detector for C#"
  homepage "https://github.com/quality-gates/messharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.15/messharp_0.2.15_darwin_arm64.tar.gz?version=0.2.15"
      sha256 "c143453df536e236365445fb268705e1a41f42450d9dec0d4201b1687c7d4ee6"
    end

    on_intel do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.15/messharp_0.2.15_darwin_amd64.tar.gz?version=0.2.15"
      sha256 "b731fb97c570e5565c324978b7e08a7fcaa27b433c7c16dddc630d569d7707fa"
    end
  end

  def install
    bin.install "messharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.15", shell_output("#{bin}/messharp --version")
  end
end
