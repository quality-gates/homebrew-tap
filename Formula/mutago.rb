class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.45/mutago_2.10.45_darwin_arm64.tar.gz?version=2.10.45"
      sha256 "0070422a2695a40b4ca5a3b214dc711ba2f07683dd26fd48829f07446bab92c6"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.45/mutago_2.10.45_darwin_amd64.tar.gz?version=2.10.45"
      sha256 "65b7c5818cb66f1c57d6f14eee43d6a15e226ca960ddd0ae4d18c2f0a7904e07"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.45", shell_output("#{bin}/mutago --version")
  end
end
