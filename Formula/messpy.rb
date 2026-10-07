class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.20/messpy_0.1.20_darwin_arm64.tar.gz?version=0.1.20"
      sha256 "6666c11f54fb8c6fe4cde11ef3f68728cc5612708438ef36316f8c321bb2cb7c"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.20/messpy_0.1.20_darwin_amd64.tar.gz?version=0.1.20"
      sha256 "cddea42a68221191fddf2007d348593dbeeb1ee78753dbc3c1d34e27d63a7bdb"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.20", shell_output("#{bin}/messpy --version")
  end
end
