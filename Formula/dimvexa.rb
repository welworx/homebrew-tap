class Dimvexa < Formula
  desc "Unit conversion with exact factors and loud failures"
  homepage "https://github.com/welworx/dimvexa"
  version "0.7.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/welworx/dimvexa/releases/download/v0.7.0/dimvexa-0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "d0011e901d8d76e5e58eb54a29a3f4d8c18ea8a77867a5aa0954d479de62c36e"
    end
    on_intel do
      url "https://github.com/welworx/dimvexa/releases/download/v0.7.0/dimvexa-0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "f0a19b5a8f376d00e252a00fa931753cc35c0fd4097a124b473141ee25b342a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/welworx/dimvexa/releases/download/v0.7.0/dimvexa-0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9bb0ff9c429d6b6479eec38fe71000683f104d3fd589ceee8f993dbaeff18926"
    end
    on_intel do
      url "https://github.com/welworx/dimvexa/releases/download/v0.7.0/dimvexa-0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "f7b009af202722a7cec3b5454118e75c1bb34c39b4e839a575252bb611223616"
    end
  end

  def install
    bin.install "dimvexa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dimvexa --version")
  end
end
