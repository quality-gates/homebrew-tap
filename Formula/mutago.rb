class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.7/mutago_2.10.7_darwin_arm64.tar.gz?version=2.10.7"
      sha256 "7fe10c3bc1e43452f1c78b10d3c41c4c7e1fc1f16b3def72fcf35e3bd684d7c5"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.7/mutago_2.10.7_darwin_amd64.tar.gz?version=2.10.7"
      sha256 "936eb69686ddacbda804815494f00d93705f6b41fc9dd5cd4f218b0f92ebbe11"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.7", shell_output("#{bin}/mutago --version")
  end
end
