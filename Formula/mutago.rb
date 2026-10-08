class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.24/mutago_2.10.24_darwin_arm64.tar.gz?version=2.10.24"
      sha256 "38ef59a91ddfcdc40f632577c3ac4d2aa45361a9ea1ed1beb452bb6f0c7a6b07"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.24/mutago_2.10.24_darwin_amd64.tar.gz?version=2.10.24"
      sha256 "05b0418b88ee23d3073d465ee41b1702e40de0e5564530df1ca2b1abbcd876eb"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.24", shell_output("#{bin}/mutago --version")
  end
end
