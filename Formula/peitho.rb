class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.43.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.43.0/peitho-v1.43.0-aarch64-apple-darwin.tar.gz"
      sha256 "b31debe7899c57602e8ee324866ab840bdf7326fe2c8232e933099191531cd3f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.43.0/peitho-v1.43.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5e3dc2c468950443cecc78a8041eeca1d7bbf19299b2552ffd65bec13cec1575"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.43.0/peitho-v1.43.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b59dfa7c3fe5d8cbb2de1d4018d3d479874cf5c47911f74735f9ee916c6f6c4f"
    end
  end

  def install
    bin.install "peitho"
    generate_completions_from_executable(bin/"peitho", "completions")
  end

  test do
    assert_match "peitho", shell_output("#{bin}/peitho --version")
  end
end
