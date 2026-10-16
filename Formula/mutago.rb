class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.30/mutago_2.10.30_darwin_arm64.tar.gz?version=2.10.30"
      sha256 "abcdaaf557479e7ea73f474526e167ece0fd09f56cdbbb2306a29fdc763356d3"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.30/mutago_2.10.30_darwin_amd64.tar.gz?version=2.10.30"
      sha256 "b0caa844599b3328cc03150e1a29227135c7325f57a23d15dbc1446a13671661"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.30", shell_output("#{bin}/mutago --version")
  end
end
