class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.42.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.42.0/peitho-v1.42.0-aarch64-apple-darwin.tar.gz"
      sha256 "d5d2c67149045eaead3c624dbb3a1c0b6db86a406b44e59c323d7ca7ea43cd52"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.42.0/peitho-v1.42.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d2e1d24c403e6975e9d40c18d0f7baef9f384d7c7d401ef3b420f33c9d3e63c7"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.42.0/peitho-v1.42.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7fc40b3d771529d71c7c5d5df22443bdf2cfbaf70177c29a44a9ad2fe3b4d9b5"
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
