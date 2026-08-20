class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.2/messpy_0.1.2_darwin_arm64.tar.gz"
      sha256 "4bc9da66c4549596cf9957800dda9db1bf9c9bfb478fd27f97f0ea6f8d16d0e1"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.2/messpy_0.1.2_darwin_amd64.tar.gz"
      sha256 "bafcb9ad11504ef81270945fa6ab41e4aef58e05f8c3fd7c660b7c6e3569380c"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.2", shell_output("#{bin}/messpy --version")
  end
end
