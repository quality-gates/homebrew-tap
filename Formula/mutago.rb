class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.44/mutago_2.10.44_darwin_arm64.tar.gz?version=2.10.44"
      sha256 "0b71371b98054b74deafa4f371e214f89b80df6b3de06c5a2a413a1ec5ccf925"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.44/mutago_2.10.44_darwin_amd64.tar.gz?version=2.10.44"
      sha256 "d0d8a1da8223e74bac2ba939dcf0cae3bc893f515b86c18c07c8b5626b72b5d1"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.44", shell_output("#{bin}/mutago --version")
  end
end
