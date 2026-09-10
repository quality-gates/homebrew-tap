class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.11/messpy_0.1.11_darwin_arm64.tar.gz?version=0.1.11"
      sha256 "3c336dcb0341e61ea93e06f362d728c952228cc82f978308937848f9320fb413"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.11/messpy_0.1.11_darwin_amd64.tar.gz?version=0.1.11"
      sha256 "a6ee0ddba0b0cb05dfa537f61e1b917e0aa68782461b450aa3d322af95b532b8"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.11", shell_output("#{bin}/messpy --version")
  end
end
