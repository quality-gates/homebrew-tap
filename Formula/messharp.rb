class Messharp < Formula
  desc "Mess detector for C#"
  homepage "https://github.com/quality-gates/messharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.4/messharp_0.2.4_darwin_arm64.tar.gz?version=0.2.4"
      sha256 "f09f436b02d3d6a14ee66a03dce5923dbe9591c7a3b24edbdf76ecffde03bc8b"
    end

    on_intel do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.4/messharp_0.2.4_darwin_amd64.tar.gz?version=0.2.4"
      sha256 "5c45d94e5330bfc5114b263330805b6f4505155e07546c71c44758c204acb517"
    end
  end

  def install
    bin.install "messharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.4", shell_output("#{bin}/messharp --version")
  end
end
