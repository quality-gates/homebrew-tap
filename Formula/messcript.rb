class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.4/messcript_0.1.4_darwin_arm64.tar.gz?version=0.1.4"
      sha256 "f490f4643dfe2410568352b43d9557038c171a2cf9492fcd93f17ebecb5d60d5"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.4/messcript_0.1.4_darwin_amd64.tar.gz?version=0.1.4"
      sha256 "8a1c2cad1db1dd0be08355ecad76987725fc0ca4d6aed795875ff3b1c1000f9e"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.4", shell_output("#{bin}/messcript --version")
  end
end
