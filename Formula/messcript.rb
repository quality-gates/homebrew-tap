class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.3/messcript_0.1.3_darwin_arm64.tar.gz?version=0.1.3"
      sha256 "be38812791d1d92515732529db73f78beaab3a8e34f568481af49ab67694fe6a"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.3/messcript_0.1.3_darwin_amd64.tar.gz?version=0.1.3"
      sha256 "92faa600a778b9da139de4854c4caa5fdef80b405f7bd64c31da6ecba60318f2"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.3", shell_output("#{bin}/messcript --version")
  end
end
