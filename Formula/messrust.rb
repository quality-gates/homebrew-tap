class Messrust < Formula
  desc "Mess detector for Rust"
  homepage "https://github.com/quality-gates/messrust"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.13/messrust_0.1.13_darwin_arm64.tar.gz?version=0.1.13"
      sha256 "f5796a2876049b0058569ea7f66bb2f748aafda45c9c887ecae31e74c79002ff"
    end

    on_intel do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.13/messrust_0.1.13_darwin_amd64.tar.gz?version=0.1.13"
      sha256 "0f3dd2d99a76507e6f6787b302ad50589b863244fc7b653ae3b88d09f350dc81"
    end
  end

  def install
    bin.install "messrust"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.13", shell_output("#{bin}/messrust --version")
  end
end
