class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.15.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.15.1/peitho-v1.15.1-aarch64-apple-darwin.tar.gz"
      sha256 "7944cdc310ebd15e8cddd7aac7a4fddb94bfad006ff4afa50e8d3c9994190019"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.15.1/peitho-v1.15.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1af305dd49b2f18cdc1e24952480a43222372c9617fc430e56946e4e77e7260d"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.15.1/peitho-v1.15.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cf449f33bd9c479c22ce0d2514da64a9eab0ac004b8896330c5ade494fa2d34d"
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
