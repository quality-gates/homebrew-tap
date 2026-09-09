class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.10/messpy_0.1.10_darwin_arm64.tar.gz?version=0.1.10"
      sha256 "419babdaca17cc15abd9c1037addea2e37d040f73fae037bd66e29b43cbaf51a"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.10/messpy_0.1.10_darwin_amd64.tar.gz?version=0.1.10"
      sha256 "010b0cf7abcb76ff0b73c7cf617d281fd6b41ca326a407690790796b54364950"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.10", shell_output("#{bin}/messpy --version")
  end
end
