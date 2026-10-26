class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.39/mutago_2.10.39_darwin_arm64.tar.gz?version=2.10.39"
      sha256 "7a7e771faca1965878fefb550b9bbbee83cd18db85cf46ee6da06df040292f0e"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.39/mutago_2.10.39_darwin_amd64.tar.gz?version=2.10.39"
      sha256 "9106dde302c03c5f90c245e17c1744add9e64025a5b2b30536b7ec887ca8ff70"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.39", shell_output("#{bin}/mutago --version")
  end
end
