class FlatexPdfCli < Formula
  desc "Extract structured JSON from German flatexDEGIRO broker PDFs"
  homepage "https://github.com/welworx/flatex-pdf-cli"
  url "https://github.com/welworx/flatex-pdf-cli/archive/refs/tags/v0.4.2.tar.gz"
  sha256 "c13304b383974e8c927b31b9e88975b450de7494f943099e1c5c0edb411a6943"
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
