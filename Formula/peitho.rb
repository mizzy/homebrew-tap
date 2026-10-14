class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.41.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.41.1/peitho-v1.41.1-aarch64-apple-darwin.tar.gz"
      sha256 "f3b21af9b251bbf619defb601fe806e52e66e3aea359635712be238625a81a4b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.41.1/peitho-v1.41.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e277dae2ea54da88dcef3a570b08a72e5afbd0074029f46ab20eb33e5aabd734"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.41.1/peitho-v1.41.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce1751b03ef11cf8823ea3c438d1c8d8305d930e6720c3daaf80a882570ba736"
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
