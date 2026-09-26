class Messfsharp < Formula
  desc "Mess detector for F#"
  homepage "https://github.com/quality-gates/messfsharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.10/messfsharp_0.1.10_darwin_arm64.tar.gz?version=0.1.10"
      sha256 "8615f80d801a681560c11c6caf7390c27b7bd83b265b77bf7324391b3dff8f3e"
    end

    on_intel do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.10/messfsharp_0.1.10_darwin_amd64.tar.gz?version=0.1.10"
      sha256 "857487918eb44fe5ba924febed194ccc58c8cef9691ca56fa275c1defd03cda6"
    end
  end

  def install
    bin.install "messfsharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.10", shell_output("#{bin}/messfsharp --version")
  end
end
