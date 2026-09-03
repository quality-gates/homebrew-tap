class Messrust < Formula
  desc "Mess detector for Rust"
  homepage "https://github.com/quality-gates/messrust"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.3/messrust_0.1.3_darwin_arm64.tar.gz?version=0.1.3"
      sha256 "aa9f7ab0c4d6a96a304741023d8b91958b2930abfd29185844c3ee3d53f83433"
    end

    on_intel do
      url "https://github.com/quality-gates/messrust/releases/download/v0.1.3/messrust_0.1.3_darwin_amd64.tar.gz?version=0.1.3"
      sha256 "45a19364bc88295033578c17d29608338bf49579a321891b0c457e9c0d4f32d3"
    end
  end

  def install
    bin.install "messrust"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.3", shell_output("#{bin}/messrust --version")
  end
end
