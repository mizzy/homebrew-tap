class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.21.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.21.0/peitho-v1.21.0-aarch64-apple-darwin.tar.gz"
      sha256 "c8f4544fb24fae57e0618dd19a4661d2ff37a91859a370fd3a2d249f1ada3f96"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.21.0/peitho-v1.21.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bfe0ab23aabce24042eda7442cc4411d4721fb4fd1b02af03cf4c8f07e37d016"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.21.0/peitho-v1.21.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2e8318dfb85e3cdae6736081587f76295329d8ed3eafa0ff2f2369ce31183fbd"
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
