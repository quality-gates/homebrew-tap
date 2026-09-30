class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.17/messpy_0.1.17_darwin_arm64.tar.gz?version=0.1.17"
      sha256 "1a1e5e221385f149a863e69d90b9b95b908ccbe8ab0ea36e1a578812de506e57"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.17/messpy_0.1.17_darwin_amd64.tar.gz?version=0.1.17"
      sha256 "628170f65644559105cf8932b3403c28d716f976c05974403c272f50470e5d83"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.17", shell_output("#{bin}/messpy --version")
  end
end
