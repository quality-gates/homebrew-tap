class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.2/messcript_0.1.2_darwin_arm64.tar.gz?version=0.1.2"
      sha256 "e08013ff1df12cc6e43a1c4c945ffd8488e6547c1f73c87053673a8f5838d48a"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.2/messcript_0.1.2_darwin_amd64.tar.gz?version=0.1.2"
      sha256 "ec6a270f3fcf87a259def206a02245b83c8cf38df01bc0299ea8b69efeb31096"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.2", shell_output("#{bin}/messcript --version")
  end
end
