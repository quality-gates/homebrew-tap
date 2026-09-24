class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.13/messcript_0.1.13_darwin_arm64.tar.gz?version=0.1.13"
      sha256 "2ba94174b98eabc0446ec0be6d3088c5382b036670ed8a5e0dfbf030ae8b7bd4"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.13/messcript_0.1.13_darwin_amd64.tar.gz?version=0.1.13"
      sha256 "f3cbf880903f46c07a4ca0e1ace1389cab6e23b7618d37f52ef4aa1b61898a57"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.13", shell_output("#{bin}/messcript --version")
  end
end
