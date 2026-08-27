class Messrust < Formula
  desc "Mess detector for Rust"
  homepage "https://github.com/quality-gates/messrust"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.1/messrust_0.1.1_darwin_arm64.tar.gz", tag: "v0.1.1"
      sha256 "dc9e05ff54d6ba00db4e376a3acfe6d675941ed4a4ee6f219ed05bdd2c8425c0"
    end

    on_intel do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.1/messrust_0.1.1_darwin_amd64.tar.gz", tag: "v0.1.1"
      sha256 "9df74e0ad17fb59320243bbd6d42a5084d857201e03b214ca8a8be78042fbf1b"
    end
  end

  def install
    bin.install "messrust"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.1", shell_output("#{bin}/messrust --version")
  end
end
