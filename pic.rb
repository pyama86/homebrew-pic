require 'formula'

HOMEBREW_PIC_PASSWD_VERSION='0.0.1'
class Pic < Formula
  homepage 'https://github.com/pyama86/pic'
  url "https://github.com/pyama86/pic/releases/download/v#{HOMEBREW_PIC_PASSWD_VERSION}/pic_darwin_amd64.zip"
  sha256 "7b744420e69b75e64bf0cc744115491c05e204cd6de57116731674d0ac8b847f"
  version HOMEBREW_PIC_PASSWD_VERSION
  head 'https://github.com/pyama86/pic.git', :branch => 'master'


  if build.head?
    depends_on 'go' => :build
    depends_on 'hg' => :build
  end

  def install
    if build.head?
      ENV['GOPATH'] = buildpath
      mkdir_p buildpath/'src/github.com/pyama86'
      ln_s buildpath, buildpath/'src/github.com/pyama86/pic'
      system 'go', 'build'
    end
    bin.install 'pic'
  end

end
