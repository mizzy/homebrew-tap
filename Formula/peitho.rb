class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.24.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.24.0/peitho-v1.24.0-aarch64-apple-darwin.tar.gz"
      sha256 "c9f2be8c63353b02bd8f6884e5fa9576191dd40d2371398c05f9cd3ef30a9905"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.24.0/peitho-v1.24.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6aff1116e15319516c91d7df5b1c29670cfb0ded3572de7686dfeb884128348b"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.24.0/peitho-v1.24.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4321b8111422ee6e56df3736081ae5a1a057929ad782ad8cd1f0636d7828f061"
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
