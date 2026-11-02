class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.12/messgo_0.5.12_darwin_arm64.tar.gz?version=0.5.12"
      sha256 "389f001ea43f2e47c5f27d1150ad4a0dc4022231d203852fb99ddab18839e78c"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.12/messgo_0.5.12_darwin_amd64.tar.gz?version=0.5.12"
      sha256 "2459da99e93da68cc8d706518cbdf21b843703d1b021fe062884008285a0f0a3"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.5.12", shell_output("#{bin}/messgo --version")
  end
end
