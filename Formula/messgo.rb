class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.15/messgo_0.5.15_darwin_arm64.tar.gz?version=0.5.15"
      sha256 "a9cfb9769be7b9ba626d8f7b25a51bc64b74083d6575830bbc4bd021bc1f1d4a"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.15/messgo_0.5.15_darwin_amd64.tar.gz?version=0.5.15"
      sha256 "4732fec6d6e8d8a64b38279792b2c81e150fc317c7eebd2c8fdeb633f01bdbe0"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.5.15", shell_output("#{bin}/messgo --version")
  end
end
