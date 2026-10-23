class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.47.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.47.0/peitho-v1.47.0-aarch64-apple-darwin.tar.gz"
      sha256 "f5bed5fba217994fbfb93fe01028c58a03882918497797531f763c48a16384a0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.47.0/peitho-v1.47.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2b1c6f159ea051b71e69643c50768b7d28f77d0c4c19a6a54022fcb61e10006f"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.47.0/peitho-v1.47.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dbee5943a4e058d7c0ec4a0a5e1d59fb512b1c174f8fe4eeee3ce0522a11b813"
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
