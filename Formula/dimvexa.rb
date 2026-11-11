class Dimvexa < Formula
  desc "Unit conversion with exact factors and loud failures"
  homepage "https://github.com/welworx/dimvexa"
  version "0.4.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/welworx/dimvexa/releases/download/v0.4.0/dimvexa-0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "f743e7e3bc6d681f84b64d355c472ae27627fde3fcf69d350173889cb208b3ae"
    end
    on_intel do
      url "https://github.com/welworx/dimvexa/releases/download/v0.4.0/dimvexa-0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "2974382f0956ab9807478d376431b4712920e37c4ed6fdbf98a8ddff3df40d67"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/welworx/dimvexa/releases/download/v0.4.0/dimvexa-0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f18f7e493ce293c70aca65eac6fc95d9a4f7d20e86436e9446a663a845bb7a5e"
    end
    on_intel do
      url "https://github.com/welworx/dimvexa/releases/download/v0.4.0/dimvexa-0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2818e124259dfcb59277febc9ff6229378ae3fd0edecf32981a603aa5e6f6757"
    end
  end

  def install
    bin.install "dimvexa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dimvexa --version")
  end
end
