require 'formula'

HOMEBREW_PINC_PASSWD_VERSION='0.0.2'
class Pinc < Formula
  homepage 'https://github.com/pyama86/pinc'
  url "https://github.com/pyama86/pinc/releases/download/v#{HOMEBREW_PINC_PASSWD_VERSION}/pinc_darwin_amd64.zip"
  sha256 "24fd95197e7b460049db37d195e3e7d68146c7a99f43cdb0eee913856112c60d"
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
