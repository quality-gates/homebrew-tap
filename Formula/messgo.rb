class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.3.0/messgo_0.3.0_darwin_arm64.tar.gz?version=0.3.0"
      sha256 "10e2884470e0dab5bb0d4cd0cddef04d716e05cca4ac814172ff0889fb81a679"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.3.0/messgo_0.3.0_darwin_amd64.tar.gz?version=0.3.0"
      sha256 "663c8f35a49545524bbb6a42f9f9bbd4620425609dd290e9d6b95551ffb82e8e"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.3.0", shell_output("#{bin}/messgo --version")
  end
end
