class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.42.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.42.1/peitho-v1.42.1-aarch64-apple-darwin.tar.gz"
      sha256 "b64c6b49c017f0c57f778f0f22e9cb89156b551f73286b40f17909c9d1b4e3bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.42.1/peitho-v1.42.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f844230a6584e48e8f88d51dcd4ded0b38f089f68e49621876cf2f30e6e34424"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.42.1/peitho-v1.42.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "241cb19f0f17cdf0fd84dc7edf592128609a7b2266f1c44d7f1e9d9c5682303a"
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
