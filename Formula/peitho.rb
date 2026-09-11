class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.27.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.27.0/peitho-v1.27.0-aarch64-apple-darwin.tar.gz"
      sha256 "593b47796879ca49df908f3882eb3d38c2a54a72c639a7c5f95a1096186925e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.27.0/peitho-v1.27.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "693b883cfc0062aac7703c4e6ae33a5bc72d80ea82f41d47a74f6cf9d6e7d43f"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.27.0/peitho-v1.27.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "96c84d03a1ef8afc8e598c0c2bdc37f7bc8319c4ce89eaa44f34f5bfad3be9bb"
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
