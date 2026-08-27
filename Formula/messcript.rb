class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.0/messcript_0.1.0_darwin_arm64.tar.gz", tag: "v0.1.0"
      sha256 "d12f2bf6c26050233d3b9c7b087ed5fe8a7494651d9d7e30670eaa7b8971af93"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.0/messcript_0.1.0_darwin_amd64.tar.gz", tag: "v0.1.0"
      sha256 "fa8d42df2dee1cd36f06ec74f5ef5ac73e3fa3551d5cf60616030823d8db9c8f"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.0", shell_output("#{bin}/messcript --version")
  end
end
