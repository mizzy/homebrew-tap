class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.38.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.38.6/peitho-v1.38.6-aarch64-apple-darwin.tar.gz"
      sha256 "bb188012b6c45738fcaa9931426a3211aec7d28e39076b6dc5dc0b3f0aaef833"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.38.6/peitho-v1.38.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2e242a97f2721aee111fb2d856cda24881b8a32cc135c861550ae62cc96438ac"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.38.6/peitho-v1.38.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5e607292692c3350a3290aaf5af1534d625ff1f109151bd63656eea8474e5cae"
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
