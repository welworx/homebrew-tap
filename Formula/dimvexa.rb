class Dimvexa < Formula
  desc "Unit conversion with exact factors and loud failures"
  homepage "https://github.com/welworx/dimvexa"
  version "0.1.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/welworx/dimvexa/releases/download/v0.1.2/dimvexa-0.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "04b17130125dcd6692fd9cbf0be9828645ffe451e84f174e0a91404ae5ace652"
    end
    on_intel do
      url "https://github.com/welworx/dimvexa/releases/download/v0.1.2/dimvexa-0.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "8f5ff8f0ac6fb6f0ca63ef927cd8fdeeab1429337facc772bb87374d0fa51ad9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/welworx/dimvexa/releases/download/v0.1.2/dimvexa-0.1.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "de3a0a2623da6f407c2273b65dea8bd8de6ff6083d50ff8290630cec1794a6ff"
    end
    on_intel do
      url "https://github.com/welworx/dimvexa/releases/download/v0.1.2/dimvexa-0.1.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3cbcffbb96f3fceccea7f6262e02d2fe9651941c9b3a454beb5f337725222c7d"
    end
  end

  def install
    bin.install "dimvexa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dimvexa --version")
  end
end
