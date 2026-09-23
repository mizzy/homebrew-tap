class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.34.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.34.0/peitho-v1.34.0-aarch64-apple-darwin.tar.gz"
      sha256 "94261d4e31101bc806a9c3bc7ead75e3591159d36d5e1ce7ee1694f513b490dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.34.0/peitho-v1.34.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "02d17c83cc19d83dd32902ba49e81bb3f516fec557664d20dcaf6c090b68e54b"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.34.0/peitho-v1.34.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "968b7d45a54fb2bf40a0b9bdad277d01d28ff437f461dffcbaa86b9c1bad219a"
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
