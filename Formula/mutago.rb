class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.41/mutago_2.10.41_darwin_arm64.tar.gz?version=2.10.41"
      sha256 "3b4f10873aa99a96d99c864a5f943d837e2f6b22ab71af7eccfb6eebb65769ef"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.41/mutago_2.10.41_darwin_amd64.tar.gz?version=2.10.41"
      sha256 "b08ef7cef88075d927c84a0eb51d3bc1dc0e0a3d80eca33069786204869a1b47"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.41", shell_output("#{bin}/mutago --version")
  end
end
