class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.28.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.28.0/peitho-v1.28.0-aarch64-apple-darwin.tar.gz"
      sha256 "041556f2f72be46e5da948d63a3a4f922951460ea569b5d24ec5533c8135bfdf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.28.0/peitho-v1.28.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "38a8143fe2eebac4ddb961fb764e2c649c7175d9e030bed6a8bd96a563a8b90f"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.28.0/peitho-v1.28.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e6bc9e71bd5121e9d4d75f1f5d6bdf2ee62914705697a394fa202aa6f7ce6ec4"
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
