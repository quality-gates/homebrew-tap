class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.21/messcript_0.1.21_darwin_arm64.tar.gz?version=0.1.21"
      sha256 "100ce37834305b072a430b413a23792953b20550f226a20c0237240831b6d047"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.21/messcript_0.1.21_darwin_amd64.tar.gz?version=0.1.21"
      sha256 "84ac70545c6b885093ba657e5cbd370e985b2d22d1f0e026af0dc26c4a70ed35"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.21", shell_output("#{bin}/messcript --version")
  end
end
