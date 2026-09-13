class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.30.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.30.0/peitho-v1.30.0-aarch64-apple-darwin.tar.gz"
      sha256 "6b56d19d5fe5e5ab163602da2d7e1475cec7619214890464c86556dfb0cb6b10"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.30.0/peitho-v1.30.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ce246e4acbb761322285c720b23100666a254123e33b3508bbf940c3f8330a32"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.30.0/peitho-v1.30.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "68c24a27384aed8c33f05866c2779b8eb8b1af498cda5a29525e8a2871620872"
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
