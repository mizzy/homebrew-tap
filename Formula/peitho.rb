class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.18.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.18.0/peitho-v1.18.0-aarch64-apple-darwin.tar.gz"
      sha256 "d0a6502d4b9a5e4a2a43fad433a1fb8e8ebde1937e3024e58b83c7b6c7db3eff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.18.0/peitho-v1.18.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "427ac1c3383574d9ef9d70af856b67abb76b91d429a2541bb1d788ea5ad324a8"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.18.0/peitho-v1.18.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6ce4a05fb2f20e96c1608bb8850cc6277723130ad9e5c754c085fad70da0397b"
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
