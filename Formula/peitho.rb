class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.24.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.24.1/peitho-v1.24.1-aarch64-apple-darwin.tar.gz"
      sha256 "7ab69c956688e6408940f0a6ac26330c24f10b53525c2c246eceb6a67b6c7e96"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.24.1/peitho-v1.24.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bacac66dce8a424e76eb140445b444e9cce33f6090e73398be4f66d4571f77c7"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.24.1/peitho-v1.24.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8a6d619b4a6d5ca7faf468b58ba1570843c8fb17838fa7121602c26250c0dfab"
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
