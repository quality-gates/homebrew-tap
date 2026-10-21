class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.19/messcript_0.1.19_darwin_arm64.tar.gz?version=0.1.19"
      sha256 "9288684b3141a20de1971aedafbb13e0e5f0eb81f63094f5e074d6168b20595e"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.19/messcript_0.1.19_darwin_amd64.tar.gz?version=0.1.19"
      sha256 "9ecf37343bf927277a04656eb662dc716a045fa31ae9dc5dbf70b030dfc146b4"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.19", shell_output("#{bin}/messcript --version")
  end
end
