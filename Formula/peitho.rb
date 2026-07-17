class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.9.0/peitho-v1.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "6103efba9e77744f87812c5fd2b2a9f4200a3ef35ef1dbd1ab69459e7fa02fad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.9.0/peitho-v1.9.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "aa7b8f4358035fb4bd3c72d610b252f66c616099de00d3ebc23364ba04e07ee5"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.9.0/peitho-v1.9.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a38aea7274b1297034d6a8d430d2854016786224d9dc148e5572b37986b09e0"
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
