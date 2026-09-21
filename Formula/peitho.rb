class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.32.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.32.0/peitho-v1.32.0-aarch64-apple-darwin.tar.gz"
      sha256 "c9e4411ce3019fd25e4dc21a41bcb658f3ec324520ac153090746af3af0a11ee"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.32.0/peitho-v1.32.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b54530a383a8a4232ecd0662bf50c1510214d0c6eecf845918ec03660e72b832"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.32.0/peitho-v1.32.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ac88c1150b0e835bf205104b276a9289a477d53c842d2dd4b07614e09ed8eb2e"
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
