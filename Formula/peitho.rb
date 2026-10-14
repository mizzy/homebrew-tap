class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.41.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.41.0/peitho-v1.41.0-aarch64-apple-darwin.tar.gz"
      sha256 "1e7eb4579953dd3eb877343fbe4151d154454eaa1d796329abeebf6ba1d3c48c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.41.0/peitho-v1.41.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "df453e8c919eaa97e4c6b8157d5860caa4072f8bd14363a9b19e4eefb1241fb8"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.41.0/peitho-v1.41.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b925bde77bbadec9ae834f84ed4befe68b78e5a22ce031c2de5fe18d8c76488c"
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
