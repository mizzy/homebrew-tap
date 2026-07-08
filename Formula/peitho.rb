class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.2.0/peitho-v1.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "2a7f822fb364191edad1f122049ac748c232ea7947e998794ed0a5cfd08b32c7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.2.0/peitho-v1.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6e1035860f5e13d2b0978719e08a2dba1bb12d6e96059ca190ccc6d72f371a3"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.2.0/peitho-v1.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "978587299647bfd38a2ac2860ada450c827275b2084eed0da55d0928b47467e5"
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
