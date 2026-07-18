class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.11.0/peitho-v1.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "654a1445197fa9eebcc784c571639ed4c61b44498345f8c92888eee503848112"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.11.0/peitho-v1.11.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6e5a6e319a06bd94522dbc3ddeaa241fab4b7024fbee998c3500381fbc40f723"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.11.0/peitho-v1.11.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5c8b2e5c10b98a31f1ba7bf85e26f1994e9a70b20a36c060ba1530742c5d6d8"
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
