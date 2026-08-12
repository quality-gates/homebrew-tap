class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.2.0/messgo_0.2.0_darwin_arm64.tar.gz"
      sha256 "e0deccadcaad6ae7a4132ffba314e5cb47623791eff92087d17c4388590d6793"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.2.0/messgo_0.2.0_darwin_amd64.tar.gz"
      sha256 "77c04a43325984e127f440bb9930b2b88f808dab367fc163e52b27dc81e94a02"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.0", shell_output("#{bin}/messgo --version")
  end
end
