class Messrust < Formula
  desc "Mess detector for Rust"
  homepage "https://github.com/quality-gates/messrust"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.14/messrust_0.1.14_darwin_arm64.tar.gz?version=0.1.14"
      sha256 "d101ac6eb8e3601fa84b486d39cc40132293e0ba70ead5eca6995f4ab3aad21b"
    end

    on_intel do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.14/messrust_0.1.14_darwin_amd64.tar.gz?version=0.1.14"
      sha256 "751f4e7e06a1e40cf8317b6a1d0fa6cb1b2a9ff3ee2872f4d0d55086f5129b85"
    end
  end

  def install
    bin.install "messrust"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.14", shell_output("#{bin}/messrust --version")
  end
end
