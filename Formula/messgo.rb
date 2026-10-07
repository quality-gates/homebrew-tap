class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.9/messgo_0.5.9_darwin_arm64.tar.gz?version=0.5.9"
      sha256 "d70b675e75511ad3721d5fdc5ce7a341d64dd1b0ef2a8d2ffcd6dd048ebe0ab9"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.9/messgo_0.5.9_darwin_amd64.tar.gz?version=0.5.9"
      sha256 "ebca8577ef59aee0b122590270ed1f69d5fc06cd96ce7237c4fd31957dc789ce"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.5.9", shell_output("#{bin}/messgo --version")
  end
end
