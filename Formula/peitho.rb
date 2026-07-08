class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.3.3/peitho-v1.3.3-aarch64-apple-darwin.tar.gz"
      sha256 "f62e90e45a9cd8e79eaed9f750481d78f81364e546538fef094a77053a4bef69"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.3.3/peitho-v1.3.3-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d1f9d600701d298ecc39bd8ba96244f3f0303e489681b76531a7262b9fce12e1"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.3.3/peitho-v1.3.3-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c21e7e44e1a4f2d6ee9366f554d943564231ccc7d2163451a11045251cf2d934"
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
