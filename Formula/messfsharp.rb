class Messfsharp < Formula
  desc "Mess detector for F#"
  homepage "https://github.com/quality-gates/messfsharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.11/messfsharp_0.1.11_darwin_arm64.tar.gz?version=0.1.11"
      sha256 "5e7b0526fb24d86f58567942874f2072b0aa3757429716edf16b41963d93b3ec"
    end

    on_intel do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.11/messfsharp_0.1.11_darwin_amd64.tar.gz?version=0.1.11"
      sha256 "a5f1168ffb9f4b723517a982a5806919ccb91e386b14a40a3c80db18e2f209ff"
    end
  end

  def install
    bin.install "messfsharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.11", shell_output("#{bin}/messfsharp --version")
  end
end
