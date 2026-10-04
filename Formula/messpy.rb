class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.18/messpy_0.1.18_darwin_arm64.tar.gz?version=0.1.18"
      sha256 "db4dec0fae181ff73720e3c3b705a507eb2287aeae2f6dd1e7aa536c1af0551e"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.18/messpy_0.1.18_darwin_amd64.tar.gz?version=0.1.18"
      sha256 "1b1e2eee822b4dee7eeee6154b774ed24270222a2ff4ef676dcda63459deeb31"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.18", shell_output("#{bin}/messpy --version")
  end
end
