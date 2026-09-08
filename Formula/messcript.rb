class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.5/messcript_0.1.5_darwin_arm64.tar.gz?version=0.1.5"
      sha256 "03220c9b004e5f72416693e72f77f4212438118d6797395604e9147119b5bcfa"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.5/messcript_0.1.5_darwin_amd64.tar.gz?version=0.1.5"
      sha256 "cb91ed18a6a543a4405849cabb2e0f7d479c39ab6d6cfc7e21099e17531d499c"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.5", shell_output("#{bin}/messcript --version")
  end
end
