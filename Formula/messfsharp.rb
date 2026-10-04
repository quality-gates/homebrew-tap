class Messfsharp < Formula
  desc "Mess detector for F#"
  homepage "https://github.com/quality-gates/messfsharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.16/messfsharp_0.1.16_darwin_arm64.tar.gz?version=0.1.16"
      sha256 "94e309a94ec8f62671738ed12b9e8db6bf0b2254d17bb7ba3faea543fad50f67"
    end

    on_intel do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.16/messfsharp_0.1.16_darwin_amd64.tar.gz?version=0.1.16"
      sha256 "3d74f031392eccc7b4b2ae47f82dc1a39e1dd68784cdf6cfb8842e96d78a01be"
    end
  end

  def install
    bin.install "messfsharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.16", shell_output("#{bin}/messfsharp --version")
  end
end
