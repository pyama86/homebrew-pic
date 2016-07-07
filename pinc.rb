require 'formula'

HOMEBREW_PINC_PASSWD_VERSION='0.0.3'
class Pinc < Formula
  homepage 'https://github.com/pyama86/pinc'
  url "https://github.com/pyama86/pinc/releases/download/v#{HOMEBREW_PINC_PASSWD_VERSION}/pinc_darwin_amd64.zip"
  sha256 "a08e21abc75296810da15c182d03c60b7b342e0f989a3d7f7339a584d4c5a43a"
  version HOMEBREW_PINC_PASSWD_VERSION
  head 'https://github.com/pyama86/pinc.git', :branch => 'master'


  if build.head?
    depends_on 'go' => :build
    depends_on 'hg' => :build
  end

  def install
    if build.head?
      ENV['GOPATH'] = buildpath
      mkdir_p buildpath/'src/github.com/pyama86'
      ln_s buildpath, buildpath/'src/github.com/pyama86/pinc'
      system 'go', 'build'
    end
    bin.install 'pinc'
  end

end
