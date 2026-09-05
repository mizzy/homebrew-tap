class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.25.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.25.1/peitho-v1.25.1-aarch64-apple-darwin.tar.gz"
      sha256 "e110d6a865b6c24db3cd32671e8354942fd5b658dc8c3a1f1679f37630aeef6c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.25.1/peitho-v1.25.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "319331051a7d81e026740818a99217e03ee36705c9fc456899a25e7d7738fc83"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.25.1/peitho-v1.25.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "697899301c725a40d012a8f2364750d6ebbb2c330fa9e037bb03ddceb58abdbd"
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
