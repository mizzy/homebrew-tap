class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.21.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.21.1/peitho-v1.21.1-aarch64-apple-darwin.tar.gz"
      sha256 "fb60e6c93b3ff4f246ce73f60b8854bf0d12a598de1a824d854211da0b97e26e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.21.1/peitho-v1.21.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c58902bfc9e8ee466117d04c9c9d9bcd231a62bfa83a162051d9982e9b4f113d"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.21.1/peitho-v1.21.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e77c31b6dd6bc3443c96dacdcaf05127d16fc6cd7fd095e9ec58e2fc362ea178"
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
