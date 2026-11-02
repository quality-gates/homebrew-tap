class Messharp < Formula
  desc "Mess detector for C#"
  homepage "https://github.com/quality-gates/messharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.22/messharp_0.2.22_darwin_arm64.tar.gz?version=0.2.22"
      sha256 "ea03758a90a47e0604f2af9c1d7bac69e4347daffa2ae424e40f7a3dd0e1fc86"
    end

    on_intel do
      url "https://github.com/quality-gates/messharp/releases/download/v0.2.22/messharp_0.2.22_darwin_amd64.tar.gz?version=0.2.22"
      sha256 "0de8dd9c2f5b497ce9547972009d76a5c9e4be8816a654ca1e928d936484449d"
    end
  end

  def install
    bin.install "messharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.2.22", shell_output("#{bin}/messharp --version")
  end
end
