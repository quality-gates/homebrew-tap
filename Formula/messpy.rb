class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.22/messpy_0.1.22_darwin_arm64.tar.gz?version=0.1.22"
      sha256 "54abc7efd5352a2440b598475ff310b5402b3a658e70261a61fa7a0437b1b1c4"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.22/messpy_0.1.22_darwin_amd64.tar.gz?version=0.1.22"
      sha256 "e5e2a1e0dbcf2505dc3ab9e71aa57c9a0e018c38fed4a59adb613ff5399d2789"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.22", shell_output("#{bin}/messpy --version")
  end
end
