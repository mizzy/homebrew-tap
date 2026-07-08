class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.3.2/peitho-v1.3.2-aarch64-apple-darwin.tar.gz"
      sha256 "ee3ecd08b88ecdb6d11d3a2146bcf9b6f50b7fba756f4fa9d64b465cfa091d5f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.3.2/peitho-v1.3.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f89caf27bf8da2523f7d5878e2dc95115933a4fd4b3296b48e865bc1886bf035"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.3.2/peitho-v1.3.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b3a0cc8957084e5601d14a195661eec0bce32daafda129942eb6474e6d7b8f88"
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
