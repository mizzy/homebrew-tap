class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.20.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.20.1/peitho-v1.20.1-aarch64-apple-darwin.tar.gz"
      sha256 "5f64d4451e21a7d8742035b33cc9735ca21611dcb7b301fa85806c1c1e10103e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.20.1/peitho-v1.20.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fcdc5df4a0f900c268ff9378a4ff9b0e5a3ce827eb66383d72234fc1aa3c0bed"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.20.1/peitho-v1.20.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7fe5ce271ba0e2699b3a91ac5ec91e014677d11832013e632e85d7896b90d244"
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
