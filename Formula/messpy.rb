class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.9/messpy_0.1.9_darwin_arm64.tar.gz?version=0.1.9"
      sha256 "ba1c31ce3563109fcc4cb837fb1675c56c28e43ec520ec5e38ba890ea300f8ac"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.9/messpy_0.1.9_darwin_amd64.tar.gz?version=0.1.9"
      sha256 "75993ce1cd652eb9c3b5783b5e703a22b49253fb65280ce130a062d81cbe0d1c"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.9", shell_output("#{bin}/messpy --version")
  end
end
