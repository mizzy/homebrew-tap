class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.15.0/peitho-v1.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "34e4eea9e222fd031bdb2ed7bdc8372b5598e008f143b6cc14dac428ae00abca"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.15.0/peitho-v1.15.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ecc8aeb3acc4a97a7342e27536828344a6c8e3dbc48bf6f845cb15f4fe0f9ef5"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.15.0/peitho-v1.15.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "52161cebe74835c7a0d6a84a22f27f063faa7e961389738484c5a68966640096"
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
