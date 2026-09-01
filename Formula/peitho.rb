class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.25.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.25.0/peitho-v1.25.0-aarch64-apple-darwin.tar.gz"
      sha256 "087604ef72aa5401004f2431ef56fbd1dbc078710493ac51157350c1d233a288"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.25.0/peitho-v1.25.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "04b1d9f8eb0d6b853fbf8ae1138fff6049c0e3e5e29d3e213e3395dd85f48124"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.25.0/peitho-v1.25.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "25d6396c3d11d2c451d7ae6ed81a9a8ce94f8cdd2e28825a4397afc101c25900"
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
