class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.38.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.38.5/peitho-v1.38.5-aarch64-apple-darwin.tar.gz"
      sha256 "29d555b8cb51274f3379e4f7ff7e7b8e7ac275044c13125d2db49ebe5f62dcf6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.38.5/peitho-v1.38.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5126d4e153615cb6b95c4f13b1e7b97a57e6b6ba04c6e0d7cd37a012b051590e"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.38.5/peitho-v1.38.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7539a67e2884c4ee860f18ea79c25fb71dfae65af44a818a680cc800e319e3d0"
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
