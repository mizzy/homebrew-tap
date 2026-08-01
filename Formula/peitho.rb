class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.19.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.19.0/peitho-v1.19.0-aarch64-apple-darwin.tar.gz"
      sha256 "b2584bc5145067a19b4a68de9aea59487005492bc1a5313fef0580f2b560f190"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.19.0/peitho-v1.19.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c509c6b573d98c45448c76f9540fd93141c83fcdc45c0c80ce39932a82209400"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.19.0/peitho-v1.19.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d1ff77cbcfdc809405f8354ffc729cc7f0c720876620ea1a4d6eaa001e3321b3"
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
