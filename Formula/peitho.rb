class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.30.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.30.1/peitho-v1.30.1-aarch64-apple-darwin.tar.gz"
      sha256 "80bf55b504dcc0364778ebf7305593084d4b09df9b5fef02773846aaaa6892e0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.30.1/peitho-v1.30.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "363f22570394684aabd3b2479152a0acdf7186e35c4bba82b528f984fe0cac24"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.30.1/peitho-v1.30.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "db924d84e99a9d1638134acd945e5202349d63745d367baf76906dfb54532e26"
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
