class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.28/mutago_2.10.28_darwin_arm64.tar.gz?version=2.10.28"
      sha256 "d8425cfbd35d6b4579d0528bc3d44b2e85d097ade0ec86d6430066d8f67c60b2"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.28/mutago_2.10.28_darwin_amd64.tar.gz?version=2.10.28"
      sha256 "68bfc7d24d7ee35fc21bb7d5bd6a154340d199692c78011e60d4191aabf30b81"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.28", shell_output("#{bin}/mutago --version")
  end
end
