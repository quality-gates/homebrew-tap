class Messfsharp < Formula
  desc "Mess detector for F#"
  homepage "https://github.com/quality-gates/messfsharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.13/messfsharp_0.1.13_darwin_arm64.tar.gz?version=0.1.13"
      sha256 "bfbe2d0cdc308873c5a636d010aeb85c859c3e99dd31c085bd7117bf8c940048"
    end

    on_intel do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.13/messfsharp_0.1.13_darwin_amd64.tar.gz?version=0.1.13"
      sha256 "880c2c268de4e063d2947c1ddc6a596be5ba5764463f175c8f3efd2a49db591c"
    end
  end

  def install
    bin.install "messfsharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.13", shell_output("#{bin}/messfsharp --version")
  end
end
