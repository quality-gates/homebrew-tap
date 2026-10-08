class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.25/mutago_2.10.25_darwin_arm64.tar.gz?version=2.10.25"
      sha256 "443a915b1bb2f00b0e8d544863b843dfdfe0d8458fc67a3788a19c6178fc3173"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.25/mutago_2.10.25_darwin_amd64.tar.gz?version=2.10.25"
      sha256 "ab6555a788c90d5aaae2883ec79b44f8e76c42554a7dc176a460d0a81f1a6d7c"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.25", shell_output("#{bin}/mutago --version")
  end
end
