class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.34/mutago_2.10.34_darwin_arm64.tar.gz?version=2.10.34"
      sha256 "a5fcd87f93f0d93a5e2dfeca657e3c3262ccb48d00416134beaf2bccf51977d5"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.34/mutago_2.10.34_darwin_amd64.tar.gz?version=2.10.34"
      sha256 "00286ef01b5cdbe1e3bfda2f59a1023a787a56c99b790f4a755168a142f46de3"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.34", shell_output("#{bin}/mutago --version")
  end
end
