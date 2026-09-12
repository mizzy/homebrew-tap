class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.29.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.29.0/peitho-v1.29.0-aarch64-apple-darwin.tar.gz"
      sha256 "f8821f14a39ec746e025ebc97fd934712eee2ffe56c4d50e9932b5be092e818c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.29.0/peitho-v1.29.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "47c1e8a60c9636f4e23a902a705931fc50b56359901905a490fa2e19cc073b96"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.29.0/peitho-v1.29.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5b6011ff2b1d4d5d48a95297b7c059ee5a414f51ea05fd1eabe6a3e5954e4541"
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
