class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.9/messcript_0.1.9_darwin_arm64.tar.gz?version=0.1.9"
      sha256 "92341149c168b0e1fefa691d7acdf6e3c3e9c9ada8e6724b05635bec8d438411"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.9/messcript_0.1.9_darwin_amd64.tar.gz?version=0.1.9"
      sha256 "0b42853071169773ecfb18717600ea773843085acf4e176b03dfb02eb67ca9f2"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.9", shell_output("#{bin}/messcript --version")
  end
end
