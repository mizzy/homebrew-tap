class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.46.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.46.0/peitho-v1.46.0-aarch64-apple-darwin.tar.gz"
      sha256 "1b46e8f70ea43ec0ed528247c57f6ec59d3328ff8f21ad162fa555f53cfc54dc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.46.0/peitho-v1.46.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e3bbfc9455ce6efd28755e10fd4539e4ff1d2b23c79f9a102675a544d7e9ddb4"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.46.0/peitho-v1.46.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8a5ff6b7fec713d9e0a8fce3316bfa397f0b8cb696a5960f4703bb9d5b28db17"
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
