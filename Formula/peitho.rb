class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.31.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.31.0/peitho-v1.31.0-aarch64-apple-darwin.tar.gz"
      sha256 "522ad57d0b75af43098dcb196fb03a628139c8232268c7d147e82b06a90c93e7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.31.0/peitho-v1.31.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2d7479343bf5cd81344479a08a8b4f92052a39c85b3afdfe397d770c39481f5a"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.31.0/peitho-v1.31.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f9ab3c0728ea2fe0c80a078b3ea8abbddfde04f22049f567e36c0de7700b737a"
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
