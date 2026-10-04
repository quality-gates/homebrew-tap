class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.8/messgo_0.5.8_darwin_arm64.tar.gz?version=0.5.8"
      sha256 "1d927a50414e144cee9b1a233e8f429ebf9747a9dbfc0e8f0f4bcc34d701ad31"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.8/messgo_0.5.8_darwin_amd64.tar.gz?version=0.5.8"
      sha256 "9d7ef69816a7f73f0417f29141d46cdfad267ad9f40397a9da95dc523f22372b"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.5.8", shell_output("#{bin}/messgo --version")
  end
end
