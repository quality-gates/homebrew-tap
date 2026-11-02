class Messfsharp < Formula
  desc "Mess detector for F#"
  homepage "https://github.com/quality-gates/messfsharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.17/messfsharp_0.1.17_darwin_arm64.tar.gz?version=0.1.17"
      sha256 "f9e7d82095d7d6d62358394cbacf5efc841af435fe1a128cf694443f79b32ff1"
    end

    on_intel do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.17/messfsharp_0.1.17_darwin_amd64.tar.gz?version=0.1.17"
      sha256 "c653d396cc6f6b50f0395357a2cf61de3c6a605fed94f1489cd1e954f2e31c23"
    end
  end

  def install
    bin.install "messfsharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.17", shell_output("#{bin}/messfsharp --version")
  end
end
