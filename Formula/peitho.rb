class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.30.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.30.5/peitho-v1.30.5-aarch64-apple-darwin.tar.gz"
      sha256 "59eb84b84b8b5315afa1ee7b12e8a772c13d801cea92c231ffa8a6a96ee5f5f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.30.5/peitho-v1.30.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "63814a76e7eaa65e42326952a8df876307767d3adf05a113f340f833202de40d"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.30.5/peitho-v1.30.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0821f7af0069c3f94867c246b61b205a85d1e2fd30afe6b680f66e29edac229a"
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
