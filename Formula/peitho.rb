class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.38.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.38.2/peitho-v1.38.2-aarch64-apple-darwin.tar.gz"
      sha256 "67a619b0eaa4148e14fe015d4d0dcdccac4f1d1823639b1289f54e5b40dbdf64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.38.2/peitho-v1.38.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5549349e5035341487de98f23d5e970af8c1bda51ffb5808af66ecd4ce235097"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.38.2/peitho-v1.38.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a1f81f6bad28875c494fc197479ae84a56e82f1b266b1ffff4ec8bb9ea529db4"
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
