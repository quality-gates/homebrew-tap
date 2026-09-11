class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.4.4/messgo_0.4.4_darwin_arm64.tar.gz?version=0.4.4"
      sha256 "b30473d764ab4ed56bbbfc64d7f36997e86cb1937e2291b47f465f1f08744e55"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.4.4/messgo_0.4.4_darwin_amd64.tar.gz?version=0.4.4"
      sha256 "678bfc4cf30957e71325e79fa6a162c63192879c8a92fd5d8b5964be1acd3893"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.4.4", shell_output("#{bin}/messgo --version")
  end
end
