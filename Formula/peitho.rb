class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.30.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.30.4/peitho-v1.30.4-aarch64-apple-darwin.tar.gz"
      sha256 "0e6ac8d883340abd087615bedbcf3a5cf1aa391366c4f51d1050d6543b3a8f12"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.30.4/peitho-v1.30.4-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8db21cc31be0bb6f23fb92b5deee262572ff18747b0b74b82fb1f3cc52837f48"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.30.4/peitho-v1.30.4-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b7e7ddc4d2b0ad68ad09353dce8c036425baa29eeebb357b1cf62fe1c51735d9"
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
