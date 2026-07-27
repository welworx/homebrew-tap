class FlatexPdfCli < Formula
  desc "Extract structured JSON from German flatexDEGIRO broker PDFs"
  homepage "https://github.com/welworx/flatex-pdf-cli"
  url "https://github.com/welworx/flatex-pdf-cli/archive/refs/tags/v0.4.0.tar.gz"
  sha256 "513a3802a97f7629643e5089f9909577d35d24423178f02ce0169d08d0f5c5fe"
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
