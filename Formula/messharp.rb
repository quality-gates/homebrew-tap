class Messharp < Formula
  desc "Mess detector for C#"
  homepage "https://github.com/quality-gates/messharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.18/messharp_0.2.18_darwin_arm64.tar.gz?version=0.2.18"
      sha256 "d54c55477dc19ac4dd4e80414907feb21aa60697f4d1501c12cded56aee55412"
    end

    on_intel do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.18/messharp_0.2.18_darwin_amd64.tar.gz?version=0.2.18"
      sha256 "f0ece88160e1c69484ee7f5460bab24a793c7183a5e2c2cf904b63e7421fa67e"
    end
  end

  def install
    bin.install "messharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.18", shell_output("#{bin}/messharp --version")
  end
end
