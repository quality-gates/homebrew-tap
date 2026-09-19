class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.14/messpy_0.1.14_darwin_arm64.tar.gz?version=0.1.14"
      sha256 "652613aa1c04e16763c729cfe204218d28e94458a7efcfd1245b70944131aa22"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.14/messpy_0.1.14_darwin_amd64.tar.gz?version=0.1.14"
      sha256 "ff902e797a86df69731d03ad84fe15c168788ad90227b5217874b1d9357497cb"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.14", shell_output("#{bin}/messpy --version")
  end
end
