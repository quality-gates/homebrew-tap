class Messharp < Formula
  desc "Mess detector for C#"
  homepage "https://github.com/quality-gates/messharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.23/messharp_0.2.23_darwin_arm64.tar.gz?version=0.2.23"
      sha256 "68efd75f2cfbd987e64feaa314a3e8b81a7d11f94652c85a92a137f3e310f70b"
    end

    on_intel do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.23/messharp_0.2.23_darwin_amd64.tar.gz?version=0.2.23"
      sha256 "130dd399bdb7523b91042a362095f6dc9fc93ece4d21c80f5e07df77344c6a4c"
    end
  end

  def install
    bin.install "messharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.23", shell_output("#{bin}/messharp --version")
  end
end
