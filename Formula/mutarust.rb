class Mutarust < Formula
  desc "Mutation testing for Rust"
  homepage "https://github.com/quality-gates/mutarust"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutarust/releases/download/v0.1.4/mutarust_0.1.4_darwin_arm64.tar.gz?version=0.1.4"
      sha256 "1d03051d6bd8439054df085080bb3349496783136ae867ed1530946343bd88b4"
    end

    on_intel do
      url "https://github.com/quality-gates/mutarust/releases/download/v0.1.4/mutarust_0.1.4_darwin_amd64.tar.gz?version=0.1.4"
      sha256 "c7f556c2b8dd7eec89a9268f612670a6b4ff51ca8096bac4ef5c696b5b8553b5"
    end
  end

  def install
    bin.install "mutarust"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.4", shell_output("#{bin}/mutarust --version")
  end
end
