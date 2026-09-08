class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.4.1/messgo_0.4.1_darwin_arm64.tar.gz?version=0.4.1"
      sha256 "ada9fbf0cfccb58a30422142e670ccf42014a2bb1e89a25726b7aeebce064830"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.4.1/messgo_0.4.1_darwin_amd64.tar.gz?version=0.4.1"
      sha256 "9771cbed2c376d2afc156d77ae5c77e0e6d88c0fc811af337deb7d3a651313f9"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.4.1", shell_output("#{bin}/messgo --version")
  end
end
