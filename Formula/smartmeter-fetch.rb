class SmartmeterFetch < Formula
  desc "Fetch smart meter readings from grid operator web portals"
  homepage "https://github.com/welworx/smartmeter-fetch"
  url "https://github.com/welworx/smartmeter-fetch/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "a068b6439cb258729da336cd2aaa84ff7856d27d12b7a26de373b7aa866c633d"
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
