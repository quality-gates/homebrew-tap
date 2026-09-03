class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.7/messpy_0.1.7_darwin_arm64.tar.gz?version=0.1.7"
      sha256 "ee4008d1af5749313240cdfcae30c7d9f17323981c4106cf84250b27ae118022"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.7/messpy_0.1.7_darwin_amd64.tar.gz?version=0.1.7"
      sha256 "09422945aacbb64a4be157676225626fff1179a6dec3a2ee3f6a39d99df8e840"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.7", shell_output("#{bin}/messpy --version")
  end
end
