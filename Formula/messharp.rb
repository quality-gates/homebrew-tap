class Messharp < Formula
  desc "Mess detector for C#"
  homepage "https://github.com/quality-gates/messharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.8/messharp_0.2.8_darwin_arm64.tar.gz?version=0.2.8"
      sha256 "31d0d35ab21391493c25b4acdaf03d7e3591236b46fdfd8d3f068e5ecff44a29"
    end

    on_intel do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.8/messharp_0.2.8_darwin_amd64.tar.gz?version=0.2.8"
      sha256 "8aa286a99741f68fab680cadafdce3ec699fc743e1ecdc927252b8202b330069"
    end
  end

  def install
    bin.install "messharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.8", shell_output("#{bin}/messharp --version")
  end
end
