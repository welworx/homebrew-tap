class Dimvexa < Formula
  desc "Unit conversion with exact factors and loud failures"
  homepage "https://github.com/welworx/dimvexa"
  version "0.2.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/welworx/dimvexa/releases/download/v0.2.2/dimvexa-0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "cf6ee43f545fb830349f400b14141432347141c3c433203718c4cae78891a71a"
    end
    on_intel do
      url "https://github.com/welworx/dimvexa/releases/download/v0.2.2/dimvexa-0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "d8783a09bd33d1015384a2597bf41c66b90daffc686af3d465ee3d933c9d28d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/welworx/dimvexa/releases/download/v0.2.2/dimvexa-0.2.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "dbcf3f755ecb71cfd4d7bb194b69f7fa1a7776a588d97e1cdcdc00a065e29d3f"
    end
    on_intel do
      url "https://github.com/welworx/dimvexa/releases/download/v0.2.2/dimvexa-0.2.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e7bbd500e5a57a7c5ded12e08e14ecc903711d83fea8e55aa80c6d7b1c23d804"
    end
  end

  def install
    bin.install "dimvexa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dimvexa --version")
  end
end
