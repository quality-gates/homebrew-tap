class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.4.6/messgo_0.4.6_darwin_arm64.tar.gz?version=0.4.6"
      sha256 "771f34a0669de4e7f7cf5672abe6efd2e1066a9a07e53f09a1ad0e1bac3cbe53"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.4.6/messgo_0.4.6_darwin_amd64.tar.gz?version=0.4.6"
      sha256 "fe6f39b6b384ee8f160475c842741a653596b668a23ab1dfc5195ffc3902ab35"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.4.6", shell_output("#{bin}/messgo --version")
  end
end
