class FlatexFetch < Formula
  desc "CLI to log into flatex.at and download document-archive PDFs"
  homepage "https://github.com/welworx/flatex-fetch"
  url "https://github.com/welworx/flatex-fetch/archive/refs/tags/v0.6.2.tar.gz"
  sha256 "2799e2818ad679a20f9d098b220261a313927ecbbff5d8a2f63021bcfc8a21ec"
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
