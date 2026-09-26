class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.2/messgo_0.5.2_darwin_arm64.tar.gz?version=0.5.2"
      sha256 "3b666636a02b3ccb32cd173db3772010c6e8b0398fb705fe82c87648759c70f5"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.2/messgo_0.5.2_darwin_amd64.tar.gz?version=0.5.2"
      sha256 "3cb9ab50acc02b06b1dcf6bb37398edd07dd9b695bbe33767d71b18074ac8373"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.5.2", shell_output("#{bin}/messgo --version")
  end
end
