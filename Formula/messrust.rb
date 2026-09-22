class Messrust < Formula
  desc "Mess detector for Rust"
  homepage "https://github.com/quality-gates/messrust"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.11/messrust_0.1.11_darwin_arm64.tar.gz?version=0.1.11"
      sha256 "de7b15dc44b8afbed79929ddc536be270c9b03c93a14dc7aa52b7568721acf49"
    end

    on_intel do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.11/messrust_0.1.11_darwin_amd64.tar.gz?version=0.1.11"
      sha256 "22799cac231d43452cbc7941252ceedb9c9477fc360acbb80a5b43ed3c9c542d"
    end
  end

  def install
    bin.install "messrust"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.11", shell_output("#{bin}/messrust --version")
  end
end
