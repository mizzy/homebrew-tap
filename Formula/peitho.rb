class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.5.0/peitho-v1.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "f9555243f9e15453b14bcb19dc9de9558f4f4796411472edf404407b6468ea3c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.5.0/peitho-v1.5.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8a509e36dfc3d002b532ea08d7b6f5f069ab2a5fa21a04fcac6465fdea6c3581"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.5.0/peitho-v1.5.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ea6b6dd2f65360dea05f36858f33c27fd9b29784c8a1a703f161060e9a38176f"
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
