class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.35.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.35.0/peitho-v1.35.0-aarch64-apple-darwin.tar.gz"
      sha256 "976448cc860233dc32b0209235fdb22cf658bdf2b9fff4c00e77debd9ef42420"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.35.0/peitho-v1.35.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "44e79e4f48241c657c5af607ec25a9aead04d375e7e907656b1ae85a5bd1f557"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.35.0/peitho-v1.35.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "78f66290f70495b4137c2c888390f8668565b12190c285fcf70fd1ce0eeff0b7"
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
