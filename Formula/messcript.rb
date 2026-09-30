class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.15/messcript_0.1.15_darwin_arm64.tar.gz?version=0.1.15"
      sha256 "77b4a7ca52564d61c67a3e73091b326ae8b7dac2f80091854b7b0d8819ae427b"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.15/messcript_0.1.15_darwin_amd64.tar.gz?version=0.1.15"
      sha256 "cee3e9dbffc7eb97fac74c5c76170727e6a74d1cc401a96a5766706fe58fe1db"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.15", shell_output("#{bin}/messcript --version")
  end
end
