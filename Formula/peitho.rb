class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.23.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.23.0/peitho-v1.23.0-aarch64-apple-darwin.tar.gz"
      sha256 "b65ef8ab440d5ae9ba0d9714ef79d1290d8e443cf97aa8f6b5a9c0509ce17622"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.23.0/peitho-v1.23.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2776d1ca546e70f5241a41c83a319e6a4501d90a87924019e639e77d1f78820f"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.23.0/peitho-v1.23.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "78edd7cbe70b16edea9dea0238b79225066e26250448fecc465d65ba311491b3"
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
