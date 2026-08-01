class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.17.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.17.1/peitho-v1.17.1-aarch64-apple-darwin.tar.gz"
      sha256 "dd8e84d99b806af93fcc4544202bac7a1d45d6090d225648ef99c59b0bc10c0e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.17.1/peitho-v1.17.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "52ddd09d67f4b0f12595cfc3f2a07fb6aa840a122538e9d74b81b9e088ffa8de"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.17.1/peitho-v1.17.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9cd9aff595a12db4962564537ceb82bf399996a17d5f6e18a105cb008ca84518"
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
