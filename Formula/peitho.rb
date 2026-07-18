class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.10.0/peitho-v1.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "0edc20ae62b5a76c96108a9e98010473ba7d3ca8f37ce77cab1b968f8a0beae3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.10.0/peitho-v1.10.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3126df20b605277c977345fde3cac896efdd7576bfeb9e374130f1bf89f8ae52"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.10.0/peitho-v1.10.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e93ca82936e1d388a673b8c0874f922b0b9be71c2a58f30603ecaac585f9a17c"
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
