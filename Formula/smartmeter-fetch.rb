class SmartmeterFetch < Formula
  desc "Fetch smart meter readings from grid operator web portals"
  homepage "https://github.com/welworx/smartmeter-fetch"
  url "https://github.com/welworx/smartmeter-fetch/archive/refs/tags/v0.3.2.tar.gz"
  sha256 "31a546afb9905da418d3ddb5192917c2e7d042dcc4854eb4bc10d3a071ff4a20"
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
