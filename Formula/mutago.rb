class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.40/mutago_2.10.40_darwin_arm64.tar.gz?version=2.10.40"
      sha256 "be225da2d8c34659688b011379bd277e28233e880be1e8dcb3b0b42b05a04a29"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.40/mutago_2.10.40_darwin_amd64.tar.gz?version=2.10.40"
      sha256 "50b735bbd1bbfb32d8e74b45ea590845b86fdf17dedf1e384b794a310e199b32"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.40", shell_output("#{bin}/mutago --version")
  end
end
