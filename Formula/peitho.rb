class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.4.0/peitho-v1.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "e61c9d74cc71f4c976990376a13fa8f807bcb77f106ec440cff3be7884eabf5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.4.0/peitho-v1.4.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b046663005cf112a73955e0507b3328b2742284a46a34039e4f7d89ce802b1ad"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.4.0/peitho-v1.4.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "eff406493d68e4836dd2caa2af02b701092b74cb58d8711179ad06ebebe32402"
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
