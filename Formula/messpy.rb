class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.5/messpy_0.1.5_darwin_arm64.tar.gz"
      sha256 "4a5ce2488ef4780ef3f177125a3f561d4f29ecbfddbc4bbdfd86bfe7935e4107"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.5/messpy_0.1.5_darwin_amd64.tar.gz"
      sha256 "b832260f73977d2a71d4d2141ad23784145d00e6983e4103440b50e83c4b2219"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.5", shell_output("#{bin}/messpy --version")
  end
end
