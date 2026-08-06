class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.22.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.22.0/peitho-v1.22.0-aarch64-apple-darwin.tar.gz"
      sha256 "15dd0e440e7ec1f4eb8a440d3909fabd0f0c7b094f83d482c12f4537b41f6f21"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.22.0/peitho-v1.22.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3c8a7ad582baefa0679c68b1bdb60dfed38613bf3c867b0956ed6725385e1d5d"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.22.0/peitho-v1.22.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6400fa4fc0ee0a41d19e40a29c7c9038eb3acbe1702be958fa5cc6454facc17b"
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
