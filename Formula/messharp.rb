class Messharp < Formula
  desc "Mess detector for C#"
  homepage "https://github.com/quality-gates/messharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.13/messharp_0.2.13_darwin_arm64.tar.gz?version=0.2.13"
      sha256 "c6753aa6a58d9f017dfa4cc199cdbe32c446f32d7c16ab8f048d91788ede6997"
    end

    on_intel do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.13/messharp_0.2.13_darwin_amd64.tar.gz?version=0.2.13"
      sha256 "26c987a8982d6af03971ceb7927cd8345fb6c8c887859e35a596333244ccf7a3"
    end
  end

  def install
    bin.install "messharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.13", shell_output("#{bin}/messharp --version")
  end
end
