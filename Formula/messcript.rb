class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.17/messcript_0.1.17_darwin_arm64.tar.gz?version=0.1.17"
      sha256 "cea31e5c2e8a3fa3dc5f6128428bc675f17f39d732a319b03ea0d8a9479c461b"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.17/messcript_0.1.17_darwin_amd64.tar.gz?version=0.1.17"
      sha256 "b9b5db242fd1b562db6686504b97dbd6425dbb96c9f2f509c58dcf66e3a5ee59"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.17", shell_output("#{bin}/messcript --version")
  end
end
