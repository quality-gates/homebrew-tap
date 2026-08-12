class Messharp < Formula
  desc "Mess detector for C#"
  homepage "https://github.com/quality-gates/messharp"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.3/messharp_0.2.3_darwin_arm64.tar.gz"
      sha256 "91b1da29c7541b2574b13834cef220a4c9b877085ce19dd1af240a4e0e14a138"
    end

    on_intel do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.3/messharp_0.2.3_darwin_amd64.tar.gz"
      sha256 "11847b513d23d5d276ad49e5785355fd928be0611b949bd524139ac412b6b727"
    end
  end

  def install
    bin.install "messharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.3", shell_output("#{bin}/messharp --version")
  end
end
