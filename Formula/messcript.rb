class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.6/messcript_0.1.6_darwin_arm64.tar.gz?version=0.1.6"
      sha256 "f7324d03c2a18b1dc0de1b061c83417672c6b6c4d1cdc3c7046ddaece927ccd2"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.6/messcript_0.1.6_darwin_amd64.tar.gz?version=0.1.6"
      sha256 "f0eaa62bf3833f39549044f81d773dd55e9241496533fa75728aef5d58be7f92"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.6", shell_output("#{bin}/messcript --version")
  end
end
