class Messfsharp < Formula
  desc "Mess detector for F#"
  homepage "https://github.com/quality-gates/messfsharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.9/messfsharp_0.1.9_darwin_arm64.tar.gz?version=0.1.9"
      sha256 "3cf30fc626be9831299412f7a10e342c8e9315a67c25272f3ca34a405e07ca3a"
    end

    on_intel do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.9/messfsharp_0.1.9_darwin_amd64.tar.gz?version=0.1.9"
      sha256 "c87ed39da7e9007de84b93dc3a0adb17a9a31838581fd533b3b170f2cc343186"
    end
  end

  def install
    bin.install "messfsharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.9", shell_output("#{bin}/messfsharp --version")
  end
end
