class Mutago < Formula
  desc "Mutation testing for Go"
  homepage "https://github.com/quality-gates/mutago"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.16/mutago_2.10.16_darwin_arm64.tar.gz?version=2.10.16"
      sha256 "a3ec75dd873941b6df68e9ab0ff0e333503208ae9fe68468ad022bc8649a3c5f"
    end

    on_intel do
      url "https://github.com/quality-gates/mutago/releases/download/v2.10.16/mutago_2.10.16_darwin_amd64.tar.gz?version=2.10.16"
      sha256 "9f4ace0c92f256e73a3c8c41c7c946da8ab490dc291bfe43e520b75c0222dc2d"
    end
  end

  def install
    bin.install "mutago"
    prefix.install "LICENSE"
  end

  test do
    assert_match "2.10.16", shell_output("#{bin}/mutago --version")
  end
end
