class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.27/mutago_2.10.27_darwin_arm64.tar.gz?version=2.10.27"
      sha256 "5c16ad40e6ac02a2f9035cbb6be786c7ebbf0b78cd227a6539d7964dc2d4867c"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.27/mutago_2.10.27_darwin_amd64.tar.gz?version=2.10.27"
      sha256 "7019aa98e4fdafd0d725e12c1fa92b8e5987faf4e859265e6ec198ed44f205d4"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.27", shell_output("#{bin}/mutago --version")
  end
end
