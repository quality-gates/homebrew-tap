class Messrust < Formula
  desc "Mess detector for Rust"
  homepage "https://github.com/quality-gates/messrust"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.4/messrust_0.1.4_darwin_arm64.tar.gz?version=0.1.4"
      sha256 "4b60f79bcc2f219ac689c5786c7c9ac0ca3e85af634b4561c6044b7009a85994"
    end

    on_intel do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.4/messrust_0.1.4_darwin_amd64.tar.gz?version=0.1.4"
      sha256 "551c4c039469440b9e43782a0cb7e5e8c9c241f7a17405ccea81575da656c553"
    end
  end

  def install
    bin.install "messrust"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.4", shell_output("#{bin}/messrust --version")
  end
end
