class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.16.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.16.0/peitho-v1.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "20957dcf9dc355adcfb0cca935bb6eb15252098d9eaa05d068c222fe9c66ed59"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.16.0/peitho-v1.16.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c022664d2cdf33db714126ebb7448b530ba5729c957fe07671d64f205aba86ee"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.16.0/peitho-v1.16.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "09aa1a44587dfd26565ff3bbbf89e6d719a7296846fe6b9ca0de3d6be9eeb5ea"
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
