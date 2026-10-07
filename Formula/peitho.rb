class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.39.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.39.0/peitho-v1.39.0-aarch64-apple-darwin.tar.gz"
      sha256 "079ba37c404561673703760259e4fc4107c66ea5875e888a25dbd1136af199cd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.39.0/peitho-v1.39.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "013b59aa07e7b95ce8c5b27b467bd5f202a171afafd6cf2e59b52edcf1e98d09"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.39.0/peitho-v1.39.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ca4f05a9b381a793a306aea1a061cf1438f617cd2bd176b57a4989cd282cbe1d"
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
