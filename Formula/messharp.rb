class Messharp < Formula
  desc "Mess detector for C#"
  homepage "https://github.com/quality-gates/messharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.7/messharp_0.2.7_darwin_arm64.tar.gz?version=0.2.7"
      sha256 "d0fd82dc0ffda523d95c5ff283d6eb7a5fb1ff50f4770de3caffaf59b13f9bd5"
    end

    on_intel do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.7/messharp_0.2.7_darwin_amd64.tar.gz?version=0.2.7"
      sha256 "e3185c3f74d8b0622d7b3f4911f484067ac2ce3c45d59aff02fc943a51b06163"
    end
  end

  def install
    bin.install "messharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.7", shell_output("#{bin}/messharp --version")
  end
end
