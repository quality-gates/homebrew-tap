class Messharp < Formula
  desc "Mess detector for C#"
  homepage "https://github.com/quality-gates/messharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.10/messharp_0.2.10_darwin_arm64.tar.gz?version=0.2.10"
      sha256 "c5ce793cd61eb5b082bc8289634bec70381943590528574af70b0a74335a1643"
    end

    on_intel do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.10/messharp_0.2.10_darwin_amd64.tar.gz?version=0.2.10"
      sha256 "d57dfec7bcd814da3aaf6d2430e626b2a5505951e8b52d0e5a96eb0f44a8714f"
    end
  end

  def install
    bin.install "messharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.10", shell_output("#{bin}/messharp --version")
  end
end
