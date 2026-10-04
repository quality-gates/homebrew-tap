class Messharp < Formula
  desc "Mess detector for C#"
  homepage "https://github.com/quality-gates/messharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.21/messharp_0.2.21_darwin_arm64.tar.gz?version=0.2.21"
      sha256 "94a805fcfa2d0d14ba6e7790ffb36160a57a670a3f8cd889323c29c0123072b9"
    end

    on_intel do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.21/messharp_0.2.21_darwin_amd64.tar.gz?version=0.2.21"
      sha256 "f39187bc44c925ab2dab1463bb9edb28aedcf2f63372434c3fa20cd5c63466fd"
    end
  end

  def install
    bin.install "messharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.21", shell_output("#{bin}/messharp --version")
  end
end
