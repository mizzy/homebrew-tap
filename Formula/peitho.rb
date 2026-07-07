class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.1.0/peitho-v1.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "aeb99bc3b99b7c6c1b1055f7e4e932de492f65ab7890456d149642b54bf25ab9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.1.0/peitho-v1.1.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c0d6403ecb7170916a91e72db0b00b2e773179d9e9b8bdd7e8bcb0bf14bb12db"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.1.0/peitho-v1.1.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1a8a97a0840160d33c8d1f590cd366b9a2157449044b4e90df6d239897722b0e"
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
