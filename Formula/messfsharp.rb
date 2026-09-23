class Messfsharp < Formula
  desc "Mess detector for F#"
  homepage "https://github.com/quality-gates/messfsharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.8/messfsharp_0.1.8_darwin_arm64.tar.gz?version=0.1.8"
      sha256 "ebb81024c5a3e6a1a8c80203b8e0e9015394c1e9987b7185d7f6098f25dd1955"
    end

    on_intel do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.8/messfsharp_0.1.8_darwin_amd64.tar.gz?version=0.1.8"
      sha256 "926ba54c014bd6fcb1c680266d309efcba8b6be3d9c99893a369650bb5685bbb"
    end
  end

  def install
    bin.install "messfsharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.8", shell_output("#{bin}/messfsharp --version")
  end
end
