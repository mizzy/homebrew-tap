class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.7.0/peitho-v1.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "2638bd2537d9fbf61de56225aede9221e0faac033ac75a379f14cbe40df3921a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.7.0/peitho-v1.7.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "41b7b4df2df2489f510d9a1a7c69f5da95dadb5a02e68a784ad35542d9acfb1b"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.7.0/peitho-v1.7.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "69421af3815705eba6ff9bf30162fb5c4c0d43f3baf1d4df269e0fe49a9cd3b3"
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
