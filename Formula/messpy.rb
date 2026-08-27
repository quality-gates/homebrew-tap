class Messpy < Formula
  desc "Mess detector for Python"
  homepage "https://github.com/quality-gates/messpy"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.6/messpy_0.1.6_darwin_arm64.tar.gz?version=0.1.6"
      sha256 "611e87dfdb8386be518428df2f436117fa4cfe0ed93d88d8fd425d3767172621"
    end

    on_intel do
      url "https://github.com/quality-gates/messpy/releases/download/v0.1.6/messpy_0.1.6_darwin_amd64.tar.gz?version=0.1.6"
      sha256 "fdbb640e407906b31b84d8554a647df7ad750f12312098c7a5b20c834c1505c7"
    end
  end

  def install
    bin.install "messpy"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.1.6", shell_output("#{bin}/messpy --version")
  end
end
