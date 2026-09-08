class Messfsharp < Formula
  desc "Mess detector for F#"
  homepage "https://github.com/quality-gates/messfsharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.3/messfsharp_0.1.3_darwin_arm64.tar.gz?version=0.1.3"
      sha256 "0d7f8a94d9f8c3f8fe415fad62ca6ea90b57f9bce9d21def5481c6135f2901d3"
    end

    on_intel do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.3/messfsharp_0.1.3_darwin_amd64.tar.gz?version=0.1.3"
      sha256 "0b663df75396cdce9999d8cbdd6e89987997f947c9d828abde721828d7e1034b"
    end
  end

  def install
    bin.install "messfsharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.3", shell_output("#{bin}/messfsharp --version")
  end
end
