class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.22/messcript_0.1.22_darwin_arm64.tar.gz?version=0.1.22"
      sha256 "16ed8a359067218acd8ebd2e0352e9072f9f1c70110ea2b639b2e8eaae8a440c"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.22/messcript_0.1.22_darwin_amd64.tar.gz?version=0.1.22"
      sha256 "9b710518eb006395254c233046346539985bd66cb9d3efc8dbe166d66c4c6dcd"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.22", shell_output("#{bin}/messcript --version")
  end
end
