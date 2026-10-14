class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.41.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.41.2/peitho-v1.41.2-aarch64-apple-darwin.tar.gz"
      sha256 "866096814387ff0bc764f3b1c88ca1f4cf75bdc448fbeea10506454f451964dd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.41.2/peitho-v1.41.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "67e801d2b362aa8b09ffa669bed1dcc8248e44fcefa5d672b7d986783e09bf2d"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.41.2/peitho-v1.41.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed1af4c379894f10f7ffdc43b2a45dd655467e6e8c692af46a2a6890b7cf12c9"
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
