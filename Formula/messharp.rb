class Messharp < Formula
  desc "Mess detector for C#"
  homepage "https://github.com/quality-gates/messharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.12/messharp_0.2.12_darwin_arm64.tar.gz?version=0.2.12"
      sha256 "2a345950eccddd95848da97da7f372aaf52dcb969917dafdc44f4169a97b7821"
    end

    on_intel do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.12/messharp_0.2.12_darwin_amd64.tar.gz?version=0.2.12"
      sha256 "c10a38069b66574113d7a965ebdb03bbe784b54e0d997ed0c61811411b645524"
    end
  end

  def install
    bin.install "messharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.12", shell_output("#{bin}/messharp --version")
  end
end
