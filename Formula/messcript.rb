class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.8/messcript_0.1.8_darwin_arm64.tar.gz?version=0.1.8"
      sha256 "a436d02eb19d5d10c08520c0051e1335e3b896f56119f8f12460bee0d828aaac"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.8/messcript_0.1.8_darwin_amd64.tar.gz?version=0.1.8"
      sha256 "62dbcc5aa4ab71ad37c7cb15234d0ac4bbf62fa521b10cffdb06adf5dc4d0424"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.8", shell_output("#{bin}/messcript --version")
  end
end
