class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.20/messcript_0.1.20_darwin_arm64.tar.gz?version=0.1.20"
      sha256 "c78a86d1d162ce22011a45b9fd0d576c2da79cb056426cf7403ff615232b57c1"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.20/messcript_0.1.20_darwin_amd64.tar.gz?version=0.1.20"
      sha256 "39c86de3e122c097cfdf963367273fdd70feb1744e5da931c77711127ce00ffb"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.20", shell_output("#{bin}/messcript --version")
  end
end
