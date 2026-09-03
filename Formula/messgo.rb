class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.3.1/messgo_0.3.1_darwin_arm64.tar.gz?version=0.3.1"
      sha256 "8d52c640afe7ec8fea41676124ac2009c8a29dfb840f26c17cf1c5b14a427810"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.3.1/messgo_0.3.1_darwin_amd64.tar.gz?version=0.3.1"
      sha256 "7853b849551598d7120455a66d12713cb6198182012fde9e288c643c5bf51d66"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.3.1", shell_output("#{bin}/messgo --version")
  end
end
