class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.6.0/peitho-v1.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "36359a0be5fd3585a3b3290285a88dd19e414c1e6d64d593141dc0004be33dfb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.6.0/peitho-v1.6.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cb254f72353355f3236581e5fcec95296500dd3bb2bf91c65aa94904c611715c"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.6.0/peitho-v1.6.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "549f7ca2e09244f5a8775567a26b13c2691a60931381ebbda489af5ff26ac1b5"
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
