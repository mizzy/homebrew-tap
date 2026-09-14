class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.30.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.30.2/peitho-v1.30.2-aarch64-apple-darwin.tar.gz"
      sha256 "1580f2d0348a8b06c1d4bdcb44e85d8ece8c9e76fbfee0e76c8c3804dfe6b87d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.30.2/peitho-v1.30.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7bf688156a391412e395c3af14513be6d35f1d50c58344b4f156ddb468a1d0ac"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.30.2/peitho-v1.30.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1b4fa9ba5ed2844d097884dd69f67704092b979dd291eddd0a6b5437552aaa09"
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
