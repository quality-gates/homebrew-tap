class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.38/mutago_2.10.38_darwin_arm64.tar.gz?version=2.10.38"
      sha256 "0e0acecc7b519c38d089cacef43afda42482e8e12fdc1ff88c3db361dc4e2676"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.38/mutago_2.10.38_darwin_amd64.tar.gz?version=2.10.38"
      sha256 "425cf649989233f37cd2a9feb2983e8a85ae76c86651b353f3334a6c34687dcd"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.38", shell_output("#{bin}/mutago --version")
  end
end
