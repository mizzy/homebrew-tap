class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.45.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.45.0/peitho-v1.45.0-aarch64-apple-darwin.tar.gz"
      sha256 "a321e41200cafa7f8c4b35d25feda41e18ea39e34b6181913622d10e8c8b03d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.45.0/peitho-v1.45.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2cd4bcc1dd5300697397a37c27d11bd056c8b1b0ccd762d722e8fe4298594581"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.45.0/peitho-v1.45.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc66fbc77c8ce184c5f5802da15735f4246b8ba247ae9968681fce92167e0932"
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
