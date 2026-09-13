class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.4.5/messgo_0.4.5_darwin_arm64.tar.gz?version=0.4.5"
      sha256 "c6aa9e647fbcfd4dbdea1c910b56c12bf30ac3db4581c021e0d16a4708f02bb6"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.4.5/messgo_0.4.5_darwin_amd64.tar.gz?version=0.4.5"
      sha256 "2c4daf784d5fe4adc7c69fbb37b296d974e97a84b96a528aa07a4135bf2aac38"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.4.5", shell_output("#{bin}/messgo --version")
  end
end
