class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.10/messcript_0.1.10_darwin_arm64.tar.gz?version=0.1.10"
      sha256 "4bb9638a26cfed0b19ee00ba7e47dbb2ae1e302952098a93f67cd5abb5c418db"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.10/messcript_0.1.10_darwin_amd64.tar.gz?version=0.1.10"
      sha256 "6413ce0f29234838ef2c56bba39a168fab4920190aeaa00919c9a9378dd706cf"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.10", shell_output("#{bin}/messcript --version")
  end
end
