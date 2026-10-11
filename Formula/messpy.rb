class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.21/messpy_0.1.21_darwin_arm64.tar.gz?version=0.1.21"
      sha256 "561df7dea83b432f454f12f38131ec906721486f223db0a5879db65b432f6580"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.21/messpy_0.1.21_darwin_amd64.tar.gz?version=0.1.21"
      sha256 "f96c9f0dd84a3bdb9b466dee2a35338dbedbc224364c78ec03bce5494a87fe0e"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.21", shell_output("#{bin}/messpy --version")
  end
end
