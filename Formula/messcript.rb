class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.7/messcript_0.1.7_darwin_arm64.tar.gz?version=0.1.7"
      sha256 "4826aa151427c93a8eda899e51d27a9d2a5520702b6622aafb4c7dfdd9435cc0"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.7/messcript_0.1.7_darwin_amd64.tar.gz?version=0.1.7"
      sha256 "9306a94a9bbf52336c19a7766b7ab381a8cad8bf5819ace6772d2befbf300740"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.7", shell_output("#{bin}/messcript --version")
  end
end
