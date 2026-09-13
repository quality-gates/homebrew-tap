class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.13/mutago_2.10.13_darwin_arm64.tar.gz?version=2.10.13"
      sha256 "4797b8f24e6897229c0e33c695e25ca74e7004c513f438659e288f8c6707a6c1"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.13/mutago_2.10.13_darwin_amd64.tar.gz?version=2.10.13"
      sha256 "fa7ebd4789888b2d407fd417c116eea15120fa46247c8d5ad09f1493b673e326"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.13", shell_output("#{bin}/mutago --version")
  end
end
