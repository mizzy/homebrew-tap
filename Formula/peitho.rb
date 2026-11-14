class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.48.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.48.1/peitho-v1.48.1-aarch64-apple-darwin.tar.gz"
      sha256 "be3cc733211ec494ee38bb5fccb3dd67a7c025b9fa4709280b99b22a763990b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.48.1/peitho-v1.48.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5460a43988c0a9f09aa1c0cf72135ed1be7275ca182449c59b0ff4db597c15aa"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.48.1/peitho-v1.48.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b064b7642a1c71c6faf3eed4694e71c3aa175ec9907aed17f6c9d8544104be6"
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
