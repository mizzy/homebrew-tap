class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.22.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.22.1/peitho-v1.22.1-aarch64-apple-darwin.tar.gz"
      sha256 "dec24b9795ee4440947a5d16d2354b38c46bfaf87a321aac67376ceb0ac38cbc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.22.1/peitho-v1.22.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3a02c5395a11d4e0bcd351d34d7e5321fccb19c9c0796d18df11e9e523d3ef74"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.22.1/peitho-v1.22.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9528eca4e90b7d8934a6bc5cd0e52da629ad6a631a16b0415085caf555003694"
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
