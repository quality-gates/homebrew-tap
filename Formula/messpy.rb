class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.23/messpy_0.1.23_darwin_arm64.tar.gz?version=0.1.23"
      sha256 "2862983894a1f4dda8faa5c021400c54064fbfe630ddce01bbc68c42a1ff51e7"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.23/messpy_0.1.23_darwin_amd64.tar.gz?version=0.1.23"
      sha256 "54c816d7ff0ecd555314ffc752b86b04e47af3fe1ad94a42bc20e8fba37395d6"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.23", shell_output("#{bin}/messpy --version")
  end
end
