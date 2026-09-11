class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.26.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.26.0/peitho-v1.26.0-aarch64-apple-darwin.tar.gz"
      sha256 "69f24f12bfc4067722fec7638cc912b0fb20c09965b305073d8f8887b2d65036"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.26.0/peitho-v1.26.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0e5a549dbfa3f17e4bbadd85704d96b704ede0a811543ca8d854a3bf88749b13"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.26.0/peitho-v1.26.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2c962785f1541de2ed41dcc44d261e9689c361a179ec9051769cedd82cdf7c2f"
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
