class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.12/messpy_0.1.12_darwin_arm64.tar.gz?version=0.1.12"
      sha256 "e72bc9eb8b442e6afe1d53a2c7b6bbe6bd0eb926631052a83b2d8619e965be84"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.12/messpy_0.1.12_darwin_amd64.tar.gz?version=0.1.12"
      sha256 "19ec9f53e8550505ed1b0783be5add0029473c10b6234282603f2d1eebc1dbd2"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.12", shell_output("#{bin}/messpy --version")
  end
end
