class FlatexPdfCli < Formula
  desc "Extract structured JSON from German flatexDEGIRO broker PDFs"
  homepage "https://github.com/welworx/flatex-pdf-cli"
  url "https://github.com/welworx/flatex-pdf-cli/archive/refs/tags/v0.6.0.tar.gz"
  sha256 "1d6ff00b1f8ea3439add8c8d570cbf0b3ec534a29adfa93cb9254ecd5d9326a1"
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
