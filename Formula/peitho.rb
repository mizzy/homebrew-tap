class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.19.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.19.1/peitho-v1.19.1-aarch64-apple-darwin.tar.gz"
      sha256 "d5f1688e81e3ecf3ac7f29d673fb901322c2ce40567fd1f4327f2600adca9d94"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.19.1/peitho-v1.19.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a541535fb1d2461d732f2409f97103677404b1542ab8abd74091f8ae7ca30c03"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.19.1/peitho-v1.19.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "81e51c1da2c2507dce3193d18b1c272c8076cf10cb8b46bd9fee31831ad1d3d1"
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
