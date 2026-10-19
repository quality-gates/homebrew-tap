class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.33/mutago_2.10.33_darwin_arm64.tar.gz?version=2.10.33"
      sha256 "398dd8cf8f163241091bff31d182258e96c78402cd8f839b9de756e7418bed46"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.33/mutago_2.10.33_darwin_amd64.tar.gz?version=2.10.33"
      sha256 "62d13d8c3d06599e3040f5cd69d1e040f158abdf0e06031be1bc7784db048b53"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.33", shell_output("#{bin}/mutago --version")
  end
end
