class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.30.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.30.3/peitho-v1.30.3-aarch64-apple-darwin.tar.gz"
      sha256 "8799259d7f0003673b26e025312cb696b34cb9088b0804cdc562b1dfbbf78ae1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.30.3/peitho-v1.30.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c11058460fa955af0c60f038b30a0e1723901891c453afaa2a7ed44c21a92bc3"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.30.3/peitho-v1.30.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "41e42224f80cb649b2d4bdde955370cb1bc112a7d2fe0c5fb3072afc65476abc"
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
