class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.40.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.40.0/peitho-v1.40.0-aarch64-apple-darwin.tar.gz"
      sha256 "6feff0572a30c171f96d4ce0f3794e6a3f9cdc998106a1003bca5722383a1214"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.40.0/peitho-v1.40.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4ff750d23c97a2916cdcff07c19a4089cabcad7d1243548ec011496e7eb3116c"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.40.0/peitho-v1.40.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "cbbcfe4772f79a05655357925e2abf2c63d8844e4ea627e614ec1fb4c2414218"
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
