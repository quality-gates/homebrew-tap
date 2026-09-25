class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.1/messgo_0.5.1_darwin_arm64.tar.gz?version=0.5.1"
      sha256 "e5a06d331e364bdd50f3859cc9291276f9be330815bc2bea5b39401c3e49bb17"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.1/messgo_0.5.1_darwin_amd64.tar.gz?version=0.5.1"
      sha256 "5fdebc8aafab9082966dde2746a34eecc62dc84816fea67436edfb201c390436"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.5.1", shell_output("#{bin}/messgo --version")
  end
end
