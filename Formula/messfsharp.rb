class Messfsharp < Formula
  desc "Mess detector for F#"
  homepage "https://github.com/quality-gates/messfsharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.14/messfsharp_0.1.14_darwin_arm64.tar.gz?version=0.1.14"
      sha256 "b038282feb81fd715b9cf27397c875472eb6f62e6036e1f23234197c8bcdd3d0"
    end

    on_intel do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.14/messfsharp_0.1.14_darwin_amd64.tar.gz?version=0.1.14"
      sha256 "a5e1c830abc38bb58a31f87c182e22c3ed1857ba0a91c6907e66414043d693c5"
    end
  end

  def install
    bin.install "messfsharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.14", shell_output("#{bin}/messfsharp --version")
  end
end
