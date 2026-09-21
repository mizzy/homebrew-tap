class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.32.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.32.1/peitho-v1.32.1-aarch64-apple-darwin.tar.gz"
      sha256 "101d3bfdbd0f79ac9b7a64aa30f3aabf1b5c9a550d5b5e8e0d9e172db7735a46"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.32.1/peitho-v1.32.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cc76e249155a5d52e93f842b82b4d3d3e787a68e87ea599f95c5276e3efbf1f0"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.32.1/peitho-v1.32.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "df83563c767489fa319f53d53b87705975d02376a36eee42da018e9c41b4c53e"
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
