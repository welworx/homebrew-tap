class FlatexFetch < Formula
  desc "CLI to log into flatex.at and download document-archive PDFs"
  homepage "https://github.com/welworx/flatex-fetch"
  url "https://github.com/welworx/flatex-fetch/archive/refs/tags/v0.7.0.tar.gz"
  sha256 "0e26f1279a81e19500e852a94b839f4a857659e3d15c628b69b9018bdd440a80"
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
