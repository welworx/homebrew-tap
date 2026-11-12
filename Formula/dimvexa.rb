class Dimvexa < Formula
  desc "Unit conversion with exact factors and loud failures"
  homepage "https://github.com/welworx/dimvexa"
  version "0.5.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/welworx/dimvexa/releases/download/v0.5.1/dimvexa-0.5.1-aarch64-apple-darwin.tar.gz"
      sha256 "dc3b13a182219f607f458ddd11e8f65d99815ae80a3cfbffc4a3c35138d265da"
    end
    on_intel do
      url "https://github.com/welworx/dimvexa/releases/download/v0.5.1/dimvexa-0.5.1-x86_64-apple-darwin.tar.gz"
      sha256 "ed23e19e9cffb1079bd70c001da3533deb3aa52610b9b905ed3dc2aea1252261"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/welworx/dimvexa/releases/download/v0.5.1/dimvexa-0.5.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "87d134fc7d6910115dadf3bab26bb310bc8bcd3143a297860fd4fd281e943a87"
    end
    on_intel do
      url "https://github.com/welworx/dimvexa/releases/download/v0.5.1/dimvexa-0.5.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2ce480d187736fbb274f229a7fed167629832d926b6987ceee6dc37db4d4e07f"
    end
  end

  def install
    bin.install "dimvexa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dimvexa --version")
  end
end
