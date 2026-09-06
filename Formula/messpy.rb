class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.8/messpy_0.1.8_darwin_arm64.tar.gz?version=0.1.8"
      sha256 "2c645fb9e3e475243de352ff789c77af5364af88ea5cfcdbbf545915bf41b55b"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.8/messpy_0.1.8_darwin_amd64.tar.gz?version=0.1.8"
      sha256 "0a8798d37780d90007566083fa742ddb7cfbda0dcc308096ee3f9cf75985a74c"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.8", shell_output("#{bin}/messpy --version")
  end
end
