class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.3/messpy_0.1.3_darwin_arm64.tar.gz"
      sha256 "2b48bddfd28366e85a8f4e5e3c4881f5c4cfc72031841a0bea29f4581599b367"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.3/messpy_0.1.3_darwin_amd64.tar.gz"
      sha256 "4e56045f850410004cec7d748dcc51b3ab9eb21301b23365a2042006a5e25001"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.3", shell_output("#{bin}/messpy --version")
  end
end
