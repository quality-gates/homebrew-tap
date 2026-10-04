class Messcript < Formula
  desc "Mess detector for JavaScript and TypeScript"
  homepage "https://github.com/quality-gates/messcript"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.16/messcript_0.1.16_darwin_arm64.tar.gz?version=0.1.16"
      sha256 "c9478d90f8b0d968702f71abeb66a4b1a9d63821862ef6a568383dcef21037dc"
    end

    on_intel do
      url "https://github.com/quality-gates/messcript/releases/download/v0.1.16/messcript_0.1.16_darwin_amd64.tar.gz?version=0.1.16"
      sha256 "a57e748a46d22987696286c3f7dd38ca0a9ddb8269baac428327d445f1f22109"
    end
  end

  def install
    bin.install "messcript"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.16", shell_output("#{bin}/messcript --version")
  end
end
