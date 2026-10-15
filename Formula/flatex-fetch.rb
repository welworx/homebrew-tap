class FlatexFetch < Formula
  desc "CLI to log into flatex.at and download document-archive PDFs"
  homepage "https://github.com/welworx/flatex-fetch"
  url "https://github.com/welworx/flatex-fetch/archive/refs/tags/v0.8.0.tar.gz"
  sha256 "15f1967f60f74bbe218ebafdfc4e1db7a993cbd16f0aa250fa3bb6098593e250"
  license "MIT"
  head "https://github.com/welworx/flatex-fetch.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version}", "-o", bin/"flatex-fetch"
  end

  test do
    assert_match "flatex-fetch", shell_output("#{bin}/flatex-fetch -help")
  end
end
