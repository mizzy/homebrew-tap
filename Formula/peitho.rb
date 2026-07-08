class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.3.1/peitho-v1.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "3e1c85bc8d77899a88ef7ad3eaa2ddad22eec4adeeaec9ccd35e34c21c721b03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.3.1/peitho-v1.3.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ff494b8d4f97f86dcfc1f373636aafb2127329cc21077a8938c35c29c05b3bde"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.3.1/peitho-v1.3.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3cf05c21e2847da5b51e7e96830c24b868c9f2235b30de51b2b755e3714078ea"
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
