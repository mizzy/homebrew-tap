class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.38.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.38.4/peitho-v1.38.4-aarch64-apple-darwin.tar.gz"
      sha256 "d8fae26223ffe2e2c5255c81a7136e0e05291cff35e2238190395b3163c0dcf2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.38.4/peitho-v1.38.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "99a3c42533af93eeab819e449d469fcc22c5ef7dc79c81f503a125be28cce944"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.38.4/peitho-v1.38.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7befc5cb104aa8b26c24961a2cb4be94c0ddddd9607d4629b5789887081f3b93"
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
