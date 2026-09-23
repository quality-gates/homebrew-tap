class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.15/messpy_0.1.15_darwin_arm64.tar.gz?version=0.1.15"
      sha256 "0dfb6152426e2595945ebcbc4a1e2f28483f832484c8ac888cf14176bb7f8734"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.15/messpy_0.1.15_darwin_amd64.tar.gz?version=0.1.15"
      sha256 "35bca219741a3694513636a7d2f9c4446f0f1a962f81b2f709cc9ebe7c54ffec"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.15", shell_output("#{bin}/messpy --version")
  end
end
