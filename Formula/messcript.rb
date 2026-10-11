class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.18/messcript_0.1.18_darwin_arm64.tar.gz?version=0.1.18"
      sha256 "80570c4a848a50cbeed1e0f45fdbe4e593aa52ad15fc4ce18fdeed05d1779c41"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.18/messcript_0.1.18_darwin_amd64.tar.gz?version=0.1.18"
      sha256 "bdd1ef07b6b6f88793030aad2fdf417e5dcbba85c337d966f4f9239a79535ac1"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.18", shell_output("#{bin}/messcript --version")
  end
end
