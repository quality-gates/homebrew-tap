class Messharp < Formula
  desc "Mess detector for C#"
  homepage "https://github.com/quality-gates/messharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.11/messharp_0.2.11_darwin_arm64.tar.gz?version=0.2.11"
      sha256 "78d762161371d9b06c97bf3ad827a11ab963d928e5e74a6a6232a373a70e30be"
    end

    on_intel do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.11/messharp_0.2.11_darwin_amd64.tar.gz?version=0.2.11"
      sha256 "7a030c7787d4cd9318443671cc7e4cdae9bf166e2d49701e73c8b3852236855b"
    end
  end

  def install
    bin.install "messharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.11", shell_output("#{bin}/messharp --version")
  end
end
