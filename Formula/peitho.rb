class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.12.0/peitho-v1.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "c85ad96ceb47961fb66a0a3640fdf5124e8b59faa004dd236e5c0f2597e3bec9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.12.0/peitho-v1.12.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3e879bba40ffd30621fbe6a2beb7f3f29d15a0c8e9a18fc66e89f798ce3c1990"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.12.0/peitho-v1.12.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3a87327549f4be78ec74f78397919a832d992f253c206e1e0581973887ef0859"
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
