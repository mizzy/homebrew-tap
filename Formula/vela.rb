class Vela < Formula
  desc "WASM Component Model optimizer"
  homepage "https://github.com/mizzy/vela"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/vela/releases/download/v0.1.0/vela-0.1.0-macos-aarch64.tar.gz"
      sha256 "f5dd9afbe9431ff021c8a48f5e254c97d3622e6a00e4b7a66816ea0201b577ee"
    else
      url "https://github.com/mizzy/vela/releases/download/v0.1.0/vela-0.1.0-macos-x86_64.tar.gz"
      sha256 "693299c37a18007a21269227ad3e5a48cf715a94d3b28a427b6f80a659c9ddf4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/vela/releases/download/v0.1.0/vela-0.1.0-linux-aarch64.tar.gz"
      sha256 "a76de6b5922381328b395e632e98f4ba965051504fd66db00e4e35cf9e6dbad5"
    else
      url "https://github.com/mizzy/vela/releases/download/v0.1.0/vela-0.1.0-linux-x86_64.tar.gz"
      sha256 "77dd9fc9c64e6a122febd68211b9e4e1e5afcbc7f623a3ecc2d348d5a402f2b4"
    end
  end

  def install
    bin.install "vela"
  end

  test do
    assert_match "vela", shell_output("#{bin}/vela --version")
  end
end
