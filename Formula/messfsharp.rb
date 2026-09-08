class Messfsharp < Formula
  desc "Mess detector for F#"
  homepage "https://github.com/quality-gates/messfsharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.2/messfsharp_0.1.2_darwin_arm64.tar.gz?version=0.1.2"
      sha256 "b9105bd43f6b3cc38b52dd27c19f754e70b15b5b71e697aead01f3fb0005417b"
    end

    on_intel do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.2/messfsharp_0.1.2_darwin_amd64.tar.gz?version=0.1.2"
      sha256 "73f0f604d0a9bf0a38b65b4f12d9e9379be5947409789c9e5914bfaccd5b7d92"
    end
  end

  def install
    bin.install "messfsharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.2", shell_output("#{bin}/messfsharp --version")
  end
end
