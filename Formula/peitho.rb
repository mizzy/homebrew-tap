class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.38.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.38.3/peitho-v1.38.3-aarch64-apple-darwin.tar.gz"
      sha256 "0f08097fc74a19990525381a7b67038b452cb68bb6aee31c1662f006cc93b819"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.38.3/peitho-v1.38.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e8adaca8075e973303e6868d08a2ca20d095a5871aa962938efcba2f31c5ecff"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.38.3/peitho-v1.38.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c13966cbfeba7dd3ecd4b29e5c0f25d243e7533364e47a740bc2356e7966d095"
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
