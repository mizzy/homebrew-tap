class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.13.0/peitho-v1.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "2514ed5c99c585a1bd3296038d51bdef1afd221a6fc89bfaa40d54880e82f9da"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.13.0/peitho-v1.13.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f68df83a6bd74b42f69952944cbc00372e09e12cd5ebd542f0c25c7ac60b6d8b"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.13.0/peitho-v1.13.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dcd00b2b0bdcf9d799d757a3e23a16143e074edae6009d0301f656b9642fa4ca"
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
