class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.38.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.38.0/peitho-v1.38.0-aarch64-apple-darwin.tar.gz"
      sha256 "ab3b5b52daa9f99997b78e4122c3abbf63c50d45903993d3987c476e9fb0f794"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.38.0/peitho-v1.38.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a4c0df19ce0b68cfc8f46e1734a78be6b52f2bb824e4ea2ca7e8c34194869946"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.38.0/peitho-v1.38.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f3d5d55245082342a7342a352edf7cc18d6eccaee313a35e13e4ce3cbc6b7d72"
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
