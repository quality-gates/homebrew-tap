class Messfsharp < Formula
  desc "Mess detector for F#"
  homepage "https://github.com/quality-gates/messfsharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.7/messfsharp_0.1.7_darwin_arm64.tar.gz?version=0.1.7"
      sha256 "23c6bc1fe83b79695555d034890185097cd400b9e32c3da139254b2dc75a5af8"
    end

    on_intel do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.7/messfsharp_0.1.7_darwin_amd64.tar.gz?version=0.1.7"
      sha256 "450b983208220048e36b9e012089731228da67eb1079106df3e42c9b8205cd6f"
    end
  end

  def install
    bin.install "messfsharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.7", shell_output("#{bin}/messfsharp --version")
  end
end
