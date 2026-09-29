class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.5/messgo_0.5.5_darwin_arm64.tar.gz?version=0.5.5"
      sha256 "80423e65dcb33840a971cd893cb1797d4a6d537b107f1bfb16d92c65b81d36c1"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.5/messgo_0.5.5_darwin_amd64.tar.gz?version=0.5.5"
      sha256 "052c85ff66ac398ce2c67d266183ffa3a664abe604cb67af1d0a4cfd2add6a17"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.5.5", shell_output("#{bin}/messgo --version")
  end
end
