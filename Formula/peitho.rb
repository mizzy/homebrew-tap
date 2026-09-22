class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.33.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.33.0/peitho-v1.33.0-aarch64-apple-darwin.tar.gz"
      sha256 "d925d14739e40953038b58b300ee1413e18cfcc8410275301c7bdd1d486e0397"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.33.0/peitho-v1.33.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0d4216bfb7c90bb3b1f5bd5ed2ab49cbd2349b1980d4dfa5a1816e9f6fa5a292"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.33.0/peitho-v1.33.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4491c0d8ecfe9b6f7acc1d87aee85a6ecf020a9bd3f41f73c89d42925993f66d"
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
