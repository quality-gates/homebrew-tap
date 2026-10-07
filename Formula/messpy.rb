class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.19/messpy_0.1.19_darwin_arm64.tar.gz?version=0.1.19"
      sha256 "d6fafe7f2f22ded294c131d49a5533b44c0472aa356c21fded740a5b924c91c8"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.19/messpy_0.1.19_darwin_amd64.tar.gz?version=0.1.19"
      sha256 "b1a4b05858fea5a880ff4b02784e1a575f72547324cac3773182cc21e088c28d"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.19", shell_output("#{bin}/messpy --version")
  end
end
