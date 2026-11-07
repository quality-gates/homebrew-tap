class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.13/messgo_0.5.13_darwin_arm64.tar.gz?version=0.5.13"
      sha256 "341a68044c66232dbef2d664bccb67b6d6738ba17bef87f40640a81a0bdcf1e6"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.13/messgo_0.5.13_darwin_amd64.tar.gz?version=0.5.13"
      sha256 "32084a46e53b2f2aefff0fad2ddab4e3b9f04a1703f330d6abfc4dda8cda42f9"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.5.13", shell_output("#{bin}/messgo --version")
  end
end
