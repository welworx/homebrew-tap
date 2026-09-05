class FlatexPdfCli < Formula
  desc "Extract structured JSON from German flatexDEGIRO broker PDFs"
  homepage "https://github.com/welworx/flatex-pdf-cli"
  url "https://github.com/welworx/flatex-pdf-cli/archive/refs/tags/v0.8.2.tar.gz"
  sha256 "3ed879742b8e16a3a1ecdd8f94c221ac9b5989be3b0c7c839c6e88c6e29fd7c4"
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
