class Messrust < Formula
  desc "Mess detector for Rust"
  homepage "https://github.com/quality-gates/messrust"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.17/messrust_0.1.17_darwin_arm64.tar.gz?version=0.1.17"
      sha256 "a8a423dd65ad5acd9e484ec4a418c3dfbc5474ceb78c30bad9b0e5b7bef39134"
    end

    on_intel do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.17/messrust_0.1.17_darwin_amd64.tar.gz?version=0.1.17"
      sha256 "a713f3961f48cc061bfef3709703956e30a7bf6555aeec81e4a88124f5830798"
    end
  end

  def install
    bin.install "messrust"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.17", shell_output("#{bin}/messrust --version")
  end
end
