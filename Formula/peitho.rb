class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.3.0/peitho-v1.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "365d7179c24f2f69b653288fd464e2d40376de442ebc9476bce2229e869bdca0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.3.0/peitho-v1.3.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fc544d2ba12ba02a7eb42f454a3edd34b1162790e7362e20ed68a626f34ff534"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.3.0/peitho-v1.3.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "06528769b06059392cff22e96ab0d6151982ab422e7b193cc307abcf7e265578"
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
