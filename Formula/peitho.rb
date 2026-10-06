class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.38.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.38.7/peitho-v1.38.7-aarch64-apple-darwin.tar.gz"
      sha256 "da824b74ccf8ad564c0ca98510dd27b2b6ef991edaf4c2eea1abac7f834cc87c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.38.7/peitho-v1.38.7-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d4f4b90a2ab74edf7b8b1cbce6a51cb3e7eecbc534787ad2d975a3a246ded38"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.38.7/peitho-v1.38.7-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "72fcb67f7dca2520d0d93df4f49291d85d8fac3f67837684ad93e1da8884abd7"
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
