class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.4/messpy_0.1.4_darwin_arm64.tar.gz"
      sha256 "6d4273f14c886ecae2535f485b2e7e3896a33d98dd98365bfda88e70f645c490"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.4/messpy_0.1.4_darwin_amd64.tar.gz"
      sha256 "b3b1f1f058d6162dac48a337e7cce88ae4d60dcbfc136b40ebe60097885e1070"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.4", shell_output("#{bin}/messpy --version")
  end
end
