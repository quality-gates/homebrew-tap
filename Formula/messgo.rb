class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.14/messgo_0.5.14_darwin_arm64.tar.gz?version=0.5.14"
      sha256 "d1069a4aff644d15877d34d9f2c904bbfe07ad6cf6de154b6117f97eb8883ff0"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.14/messgo_0.5.14_darwin_amd64.tar.gz?version=0.5.14"
      sha256 "4494cd3004d8f8729b131e20b15d81f29759b3b5659f7093e0a20116ec4e9452"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.5.14", shell_output("#{bin}/messgo --version")
  end
end
