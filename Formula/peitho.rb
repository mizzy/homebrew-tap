class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.17.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.17.0/peitho-v1.17.0-aarch64-apple-darwin.tar.gz"
      sha256 "1bb243954383932cfa69ce4c9442781ed4477bb9e160b83264fed4b815e28566"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.17.0/peitho-v1.17.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b38f180f5138474522b5d8a402d431abdfcd8782ada318942c959993a9cdf425"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.17.0/peitho-v1.17.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a4ab8e190b48673a12786256e81117c198b29016a65d48faee338fe31723645"
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
