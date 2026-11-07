class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.24/messpy_0.1.24_darwin_arm64.tar.gz?version=0.1.24"
      sha256 "8390cc488d5e4bcb4b507beb37dbcb9757aa4a48ad87a318ddeac50183c30bfa"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.24/messpy_0.1.24_darwin_amd64.tar.gz?version=0.1.24"
      sha256 "4f261e14881e8cc353ee9ab31a698924da9d536a685b9d4b57418fc684946c69"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.24", shell_output("#{bin}/messpy --version")
  end
end
