class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.4/messgo_0.5.4_darwin_arm64.tar.gz?version=0.5.4"
      sha256 "387a641dfd2a17f5d8ec85b1a6ed849b59dbfa8df5aa2726fd957c0ecd7597c9"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.4/messgo_0.5.4_darwin_amd64.tar.gz?version=0.5.4"
      sha256 "e83685649595e89f121239954609a2eb3479fa29ac17808d4f955c40985b9b99"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.5.4", shell_output("#{bin}/messgo --version")
  end
end
