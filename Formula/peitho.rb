class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.48.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.48.0/peitho-v1.48.0-aarch64-apple-darwin.tar.gz"
      sha256 "58c7700cadb22f4702cdbeaae9ea07e9563004f2385557423cc14cbc66798122"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.48.0/peitho-v1.48.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f27d5a77c52531ad9b5c8d9c6a9e41fa71d63ae35e1fd753a26083fc4775a1c9"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.48.0/peitho-v1.48.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5cd34ccfe03bca3803699da6593d1f9de09edebbbe7856b6d153b80d78af9818"
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
