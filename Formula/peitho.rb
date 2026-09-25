class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.36.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.36.0/peitho-v1.36.0-aarch64-apple-darwin.tar.gz"
      sha256 "cb15a408baad76a954875564140b3e2abc96ec8bc574d52a11ade1aae9ff7a7f"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.36.0/peitho-v1.36.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "03213e3d07af61acf221d2c060b20f01b6b70629153c836748786e5776e9aa41"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.36.0/peitho-v1.36.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e9d7e48645b57c19cd76e9d45b1e7869fac5be773de67d49300a01b10192341d"
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
