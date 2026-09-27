class Messharp < Formula
  desc "Mess detector for C#"
  homepage "https://github.com/quality-gates/messharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.19/messharp_0.2.19_darwin_arm64.tar.gz?version=0.2.19"
      sha256 "bb36efef92bb332f132f4c4a52d9fb338ebbab16b95de9ec8535471475e076b3"
    end

    on_intel do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.19/messharp_0.2.19_darwin_amd64.tar.gz?version=0.2.19"
      sha256 "c020020c61021c5902d5d1fd3791157c70800cdd903a6c44bdd7686e30323fbf"
    end
  end

  def install
    bin.install "messharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.19", shell_output("#{bin}/messharp --version")
  end
end
