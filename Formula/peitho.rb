class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.46.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.46.1/peitho-v1.46.1-aarch64-apple-darwin.tar.gz"
      sha256 "bbae0af4e5d3c11bf6510932a26de31a17d6780a4a081cd93faf1daa3bc812d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.46.1/peitho-v1.46.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2835b00c7198dc90a12982039550c14094a4fc2a315377116276bc0338640762"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.46.1/peitho-v1.46.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e82959be5d382beb669a80b2d935a49ac0f3d5f4fb39ef1cc02ace267985e782"
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
