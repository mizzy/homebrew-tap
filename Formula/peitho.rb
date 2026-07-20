class Peitho < Formula
  desc "HTML-native presentation tool with Markdown as the source of truth"
  homepage "https://github.com/mizzy/peitho"
  version "1.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.14.0/peitho-v1.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "bcbdd302998ba27b19318a19f0a97efd812f4365e9ca85430b5e446a3f4de818"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/mizzy/peitho/releases/download/v1.14.0/peitho-v1.14.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "82c9b9b5f2f84290754cd9f425080a2b93458e4de920619523b15a46667a3195"
    else
      url "https://github.com/mizzy/peitho/releases/download/v1.14.0/peitho-v1.14.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fc2cfeb966dda056a1e6a7b97302f9284cfdafec61cc71676977f7c1c32c48b9"
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
