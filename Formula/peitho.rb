class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.8.0/peitho-v1.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "376c432b200e895bd207c8cbec1425d27f5469e73e6b60e46e0bc074ddd10416"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.8.0/peitho-v1.8.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d213fb934d2edfb7c8dcab8496b5ce525b78b91e1ea8d5ae978f2c0035bb3980"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.8.0/peitho-v1.8.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8468975d7563ccd6ea605de4daf0a1a9430f73c05132d32be6f9e8fde02fe1ee"
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
