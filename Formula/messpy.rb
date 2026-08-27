class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.1/messpy_0.1.1_darwin_arm64.tar.gz"
      sha256 "f5873d1f0d1cf06b0608ec5cc9759beac69f11e280a257c0cc037732861089a5"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.1/messpy_0.1.1_darwin_amd64.tar.gz"
      sha256 "12155e3b9269b4649076df5bc30f557d9206135e6a2f3329f7ca18472ee6cca9"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/messpy --version")
  end
end
