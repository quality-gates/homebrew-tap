class Messrust < Formula
  desc "Mess detector for Rust"
  homepage "https://github.com/quality-gates/messrust"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.7/messrust_0.1.7_darwin_arm64.tar.gz?version=0.1.7"
      sha256 "56f2ba25bc14b0516442ef8a653f9aa6e8624510c5b58c2ccaf727a26811cf80"
    end

    on_intel do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.7/messrust_0.1.7_darwin_amd64.tar.gz?version=0.1.7"
      sha256 "087471f4e8c14454b3761a2bf0384de457f7505b8e33fc89c9018d7787daa7d9"
    end
  end

  def install
    bin.install "messrust"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.7", shell_output("#{bin}/messrust --version")
  end
end
