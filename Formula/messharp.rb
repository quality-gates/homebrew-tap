class Messharp < Formula
  desc "Mess detector for C#"
  homepage "https://github.com/quality-gates/messharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.16/messharp_0.2.16_darwin_arm64.tar.gz?version=0.2.16"
      sha256 "d83c33c94885698caf54f387059760ebbd225acd9b974e5a52031d45bd27b5d0"
    end

    on_intel do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.16/messharp_0.2.16_darwin_amd64.tar.gz?version=0.2.16"
      sha256 "04a327486ad214de8c2cb0100ef5a6dea31971c28d49ffc28a745d88aee2752e"
    end
  end

  def install
    bin.install "messharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.16", shell_output("#{bin}/messharp --version")
  end
end
