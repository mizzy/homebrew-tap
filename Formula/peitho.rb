class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.44.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.44.0/peitho-v1.44.0-aarch64-apple-darwin.tar.gz"
      sha256 "2d517ac95d1fcd3d37ffbc287574704dacb61e93463ca315df6942ab5501c1d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.44.0/peitho-v1.44.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b17e0c0e280df6d3b1e2fa5e3c7cf0d44d9ff79c58fbf06124cc46b9600100db"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.44.0/peitho-v1.44.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7c1357916c6383e07da81a49e017bd5707ea3f282fcf2ea6a55303a123301996"
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
