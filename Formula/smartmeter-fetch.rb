class SmartmeterFetch < Formula
  desc "Fetch smart meter readings from grid operator web portals"
  homepage "https://github.com/welworx/smartmeter-fetch"
  url "https://github.com/welworx/smartmeter-fetch/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "ca2307f94cd49c6cc5acf7171ed5c037be2bd602e3057cfba7aa1f4f4ea91007"
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
