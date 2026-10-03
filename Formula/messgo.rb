class Messgo < Formula
  desc "PHP Mess Detector port for Go"
  homepage "https://github.com/quality-gates/messgo"
  license "MIT"
  version_scheme 1

  on_macos do
    on_arm do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.7/messgo_0.5.7_darwin_arm64.tar.gz?version=0.5.7"
      sha256 "c4375dcd036553fee2f516191d1215e50cb804487e7c3488c8d316ddf726fdd7"
    end

    on_intel do
      url "https://github.com/quality-gates/messgo/releases/download/v0.5.7/messgo_0.5.7_darwin_amd64.tar.gz?version=0.5.7"
      sha256 "57a5933ea8e9a366a35b617c7081f041470749966e350777df2650ce345437bb"
    end
  end

  def install
    bin.install "messgo"
    prefix.install "LICENSE"
  end

  test do
    assert_match "0.5.7", shell_output("#{bin}/messgo --version")
  end
end
