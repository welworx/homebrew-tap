class SmartmeterFetch < Formula
  desc "Fetch smart meter readings from grid operator web portals"
  homepage "https://github.com/welworx/smartmeter-fetch"
  url "https://github.com/welworx/smartmeter-fetch/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "60da0c56567de8ed0ebad86e01efc4f86bb287655e0bfa128ee641ea88540927"
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
