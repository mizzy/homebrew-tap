class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.20.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.20.0/peitho-v1.20.0-aarch64-apple-darwin.tar.gz"
      sha256 "4a1a699225c9887ebe6bf0207f091d6e53d17bbd91c058c17367478f0ea1bbb3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.20.0/peitho-v1.20.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b3e06ee7f6185b3d1245fca18a9c9cdb5ad1f366b01434be6ed21a3ba6589f3d"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.20.0/peitho-v1.20.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a559d952535c397a9a3c3fe1aaf72e5ab2f8f2a8801e35d63492986f367f1e41"
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
