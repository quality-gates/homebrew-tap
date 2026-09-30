class Messharp < Formula
  desc "Mess detector for C#"
  homepage "https://github.com/quality-gates/messharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.20/messharp_0.2.20_darwin_arm64.tar.gz?version=0.2.20"
      sha256 "c164ee61a728bf72e134a7131bd28ab437877a4ef40c485dd2a530a92515f47c"
    end

    on_intel do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.20/messharp_0.2.20_darwin_amd64.tar.gz?version=0.2.20"
      sha256 "7ab231d723dd0ec6c4d7920f8c5cd0de09d03027f891bf8d039df7453f5e2e0f"
    end
  end

  def install
    bin.install "messharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.20", shell_output("#{bin}/messharp --version")
  end
end
