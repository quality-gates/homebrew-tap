class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.10/messgo_0.5.10_darwin_arm64.tar.gz?version=0.5.10"
      sha256 "19c7c3ba68873bd7ba92e101d7c312eda1c3c06318298c0e686c0ddbc6598814"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.10/messgo_0.5.10_darwin_amd64.tar.gz?version=0.5.10"
      sha256 "8f208b23a2143bae18737c54e07dbcc58978ba8678948d32d0cc3caf618fe517"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.5.10", shell_output("#{bin}/messgo --version")
  end
end
