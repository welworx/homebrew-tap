class SmartmeterFetch < Formula
  desc "Fetch smart meter readings from grid operator web portals"
  homepage "https://github.com/welworx/smartmeter-fetch"
  url "https://github.com/welworx/smartmeter-fetch/archive/refs/tags/v0.3.1.tar.gz"
  sha256 "aed52f8debfb0e9d134e5b21875dff8bc717d95385d1908d6790a995dbd86c47"
  license "GPL-3.0-only"
  head "https://github.com/welworx/smartmeter-fetch.git", branch: "main"

  depends_on "go" => :build

  def install
    system "go", "build", "-ldflags", "-X main.version=#{version}", "-o", bin/"smartmeter-fetch"
  end

  test do
    assert_match "smartmeter-fetch #{version}", shell_output("#{bin}/smartmeter-fetch version")
  end
end
