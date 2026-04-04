class Vela < Formula
  desc "WASM Component Model optimizer"
  homepage "https://github.com/mizzy/vela"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/vela/releases/download/v#{version}/vela-aarch64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/mizzy/vela/releases/download/v#{version}/vela-x86_64-apple-darwin.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/vela/releases/download/v#{version}/vela-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER"
    else
      url "https://github.com/mizzy/vela/releases/download/v#{version}/vela-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    bin.install "vela"
  end

  test do
    assert_match "vela", shell_output("#{bin}/vela --version")
  end
end
