class Messharp < Formula
  desc "Mess detector for C#"
  homepage "https://github.com/quality-gates/messharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.9/messharp_0.2.9_darwin_arm64.tar.gz?version=0.2.9"
      sha256 "850ae9ca62e9fbbe97bab6e58ce9ecda394b3d60c41fba431dd722d424b692e5"
    end

    on_intel do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.9/messharp_0.2.9_darwin_amd64.tar.gz?version=0.2.9"
      sha256 "e1ac61e6971de8ef3c0f234862ccfa15bbb7c46dd4a4345051d2b01dd78b986a"
    end
  end

  def install
    bin.install "messharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.9", shell_output("#{bin}/messharp --version")
  end
end
