class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.18/mutago_2.10.18_darwin_arm64.tar.gz?version=2.10.18"
      sha256 "ca4abfb924bb157d221e9d28d40a7e1298dc7354ef2e6b1ccd70159f8d2fa490"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.18/mutago_2.10.18_darwin_amd64.tar.gz?version=2.10.18"
      sha256 "ef039543a9399877dc281cab61773df22e84f112f3dff79fda29e452137a4bd8"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.18", shell_output("#{bin}/mutago --version")
  end
end
