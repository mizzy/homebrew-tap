class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.37.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.37.0/peitho-v1.37.0-aarch64-apple-darwin.tar.gz"
      sha256 "bd79a37b1ab0ecebb5a13494e66d00970729fc29f5f83569704cd23f87dcf218"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.37.0/peitho-v1.37.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e8bd89dcbb0c060dd39d042affbefc968abda651c7607a956125dbd26e865166"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.37.0/peitho-v1.37.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "40d4bf8d6ba4b82b08155e8572cc3f55b1718267e346faaa5aff2e7fba962b6f"
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
