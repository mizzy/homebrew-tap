class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.25.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.25.2/peitho-v1.25.2-aarch64-apple-darwin.tar.gz"
      sha256 "bf5d707205e268fd2f232122be69b9429ddf9a2c1e8a0986e282a4eed1469450"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.25.2/peitho-v1.25.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3a1147f2c891d61a5c9920039e4a879523d27c4e44fc937103e79804c134fcf6"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.25.2/peitho-v1.25.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f86629430eb2d8df42fa52e1f1437dad5790adfc05adc01fa5389d7e1c6b8da1"
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
