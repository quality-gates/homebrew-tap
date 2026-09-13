class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.13/messpy_0.1.13_darwin_arm64.tar.gz?version=0.1.13"
      sha256 "784c2a98b43bf693638a8b73362969dd1696791d6ce10613739e9b2abc68b795"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.13/messpy_0.1.13_darwin_amd64.tar.gz?version=0.1.13"
      sha256 "d49ebcd930f74c8070cb33d8ae364e4ba95405d9fb3b22b5e4cc9b89a8affa43"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.13", shell_output("#{bin}/messpy --version")
  end
end
