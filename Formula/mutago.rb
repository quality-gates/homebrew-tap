class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.29/mutago_2.10.29_darwin_arm64.tar.gz?version=2.10.29"
      sha256 "598d44bee46a5359811f86cc7278d92973d149f36d280ca8ab5e0aaa69108ccc"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.29/mutago_2.10.29_darwin_amd64.tar.gz?version=2.10.29"
      sha256 "7e7aac16f7e10f4eb1952df65f75f0a4e057bd8ae87c78747d5fe1a086073745"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.29", shell_output("#{bin}/mutago --version")
  end
end
