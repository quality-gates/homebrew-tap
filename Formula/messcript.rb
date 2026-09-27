class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.14/messcript_0.1.14_darwin_arm64.tar.gz?version=0.1.14"
      sha256 "440e0d9d7f333eeb7559d966fa09e10055b4d3985e2bf6705dabac7043bb4a91"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.14/messcript_0.1.14_darwin_amd64.tar.gz?version=0.1.14"
      sha256 "3a77e62c330054e58a6dc55b39ce5528a362afb3c967f25fbaf94901f2e6079f"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.14", shell_output("#{bin}/messcript --version")
  end
end
