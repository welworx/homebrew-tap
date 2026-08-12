class FlatexPdfCli < Formula
  desc "Extract structured JSON from German flatexDEGIRO broker PDFs"
  homepage "https://github.com/welworx/flatex-pdf-cli"
  url "https://github.com/welworx/flatex-pdf-cli/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "b18f4fd361ead306157e7db3738f119d023ddf575dd3d830fb2da2b5f5fd0ab7"
  license "MIT"
  head "https://github.com/welworx/flatex-pdf-cli.git", branch: "master"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version}", "-o", bin/"flatex-pdf-cli"
  end

  test do
    assert_match "flatex-pdf-cli", shell_output("#{bin}/flatex-pdf-cli -help")
  end
end
