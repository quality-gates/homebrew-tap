class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.11/messcript_0.1.11_darwin_arm64.tar.gz?version=0.1.11"
      sha256 "9abe2ca5956e3c75e5406e582d51fb8d9c9f2848c619c97f7206e9c655a906d5"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.11/messcript_0.1.11_darwin_amd64.tar.gz?version=0.1.11"
      sha256 "322f6a9f8c6e719fc1824f93fb6c3d5b6ed1fd8054c6a7aef36615dee32d15bc"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.11", shell_output("#{bin}/messcript --version")
  end
end
