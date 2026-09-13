class Messrust < Formula
  desc "Mess detector for Rust"
  homepage "https://github.com/quality-gates/messrust"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.10/messrust_0.1.10_darwin_arm64.tar.gz?version=0.1.10"
      sha256 "2679ca88b08fc12944abf36fa16101185330765a59da2194002148d4f2e39eb1"
    end

    on_intel do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.10/messrust_0.1.10_darwin_amd64.tar.gz?version=0.1.10"
      sha256 "9fad4fe55439773f324ed8eecaa0adbe4947df8429af0c667bbd277d14a676f7"
    end
  end

  def install
    bin.install "messrust"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.10", shell_output("#{bin}/messrust --version")
  end
end
