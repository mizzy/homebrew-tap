class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.0.0/peitho-v1.0.0-aarch64-apple-darwin.tar.gz"
      sha256 "83bca87ca6cf840ed60b1a288de2014394e9b6e250d9fb572b2d76abb960e086"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.0.0/peitho-v1.0.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f2d26e3305d326ca97230c86e1aa8496fe12dddbca85e6e5a4991b27676ea1db"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.0.0/peitho-v1.0.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ff89f4776f35c2ab07953cd7c807b27138b320b360db2a9d1a6424128350c564"
    end
  end

  def install
    bin.install "peitho"
  end

  test do
    assert_match "peitho", shell_output("#{bin}/peitho --version")
  end
end
