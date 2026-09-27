class Messrust < Formula
  desc "Mess detector for Rust"
  homepage "https://github.com/quality-gates/messrust"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.16/messrust_0.1.16_darwin_arm64.tar.gz?version=0.1.16"
      sha256 "8bdaa1e1b701787497e8cd128cd986bb695549466a65486f401a19ae40abae57"
    end

    on_intel do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.16/messrust_0.1.16_darwin_amd64.tar.gz?version=0.1.16"
      sha256 "7383674d1107e739226b5a3953e585d3496753d2488b80b57f087982b78ffa19"
    end
  end

  def install
    bin.install "messrust"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.16", shell_output("#{bin}/messrust --version")
  end
end
