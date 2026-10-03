class Messfsharp < Formula
  desc "Mess detector for F#"
  homepage "https://github.com/quality-gates/messfsharp"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.15/messfsharp_0.1.15_darwin_arm64.tar.gz?version=0.1.15"
      sha256 "dd3da56404d7770b8c4a0ba5ff4c6a1ca0bc354a50cabd837ed4e15bb4f72103"
    end

    on_intel do
      url "https://github.com/quality-gates/messfsharp/releases/download/v0.1.15/messfsharp_0.1.15_darwin_amd64.tar.gz?version=0.1.15"
      sha256 "9939a1bd73f601e2bac8b9bee6558b68609e5ced43f8bf5c4ab88161310f4e23"
    end
  end

  def install
    bin.install "messfsharp"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.15", shell_output("#{bin}/messfsharp --version")
  end
end
