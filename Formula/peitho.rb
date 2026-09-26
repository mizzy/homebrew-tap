class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.38.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.38.1/peitho-v1.38.1-aarch64-apple-darwin.tar.gz"
      sha256 "4ac9c13a413c0eb1674932c78e192ce9c21053566771b96aef72ac51d1257926"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.38.1/peitho-v1.38.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c29b59c7c7f9167dfb41cb2e91fb800c7e71a06ac0338bfa37c33d9171d10d83"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.38.1/peitho-v1.38.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8e6080590e4f03f86fb7ef32465fe21241b722f48a02a8edcf554515be8bbe8c"
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
