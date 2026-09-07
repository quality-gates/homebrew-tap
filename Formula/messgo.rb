class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.4.0/messgo_0.4.0_darwin_arm64.tar.gz?version=0.4.0"
      sha256 "f11494b90e79867a4e2871ff59287f823e55b64bac02a1b96ebae0d7fb3a4892"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.4.0/messgo_0.4.0_darwin_amd64.tar.gz?version=0.4.0"
      sha256 "c57e5f9286846290f7d6173f5659cb82444016cd48f0fc7ecf9bc530108f58c4"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.4.0", shell_output("#{bin}/messgo --version")
  end
end
