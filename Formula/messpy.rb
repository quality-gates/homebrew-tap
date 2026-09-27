class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.16/messpy_0.1.16_darwin_arm64.tar.gz?version=0.1.16"
      sha256 "0ed6f34048f9b168a6e6c680e65cf00c4c83dc1b2b58b4c991358a5341769cc4"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.16/messpy_0.1.16_darwin_amd64.tar.gz?version=0.1.16"
      sha256 "129921e30ab5d9f0b0d948dd294a4e40f8887d6a0d837971717b2b7cd3a5d96f"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.16", shell_output("#{bin}/messpy --version")
  end
end
