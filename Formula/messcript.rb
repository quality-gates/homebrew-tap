class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.12/messcript_0.1.12_darwin_arm64.tar.gz?version=0.1.12"
      sha256 "b67c301eae6cd48e0eae25bf7a2186ca79829ac84f38e34b68c493cca88b29ec"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.12/messcript_0.1.12_darwin_amd64.tar.gz?version=0.1.12"
      sha256 "5e178094a944b3593c38eb75b76183ed489b67aca143c6be5aa77593dc518c90"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.12", shell_output("#{bin}/messcript --version")
  end
end
