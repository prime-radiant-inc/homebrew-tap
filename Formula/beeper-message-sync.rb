class BeeperMessageSync < Formula
  desc "Sync Beeper chat history to local storage"
  homepage "https://github.com/prime-radiant-inc/beeper-message-sync"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/prime-radiant-inc/beeper-message-sync/releases/download/v#{version}/beeper-message-sync-darwin-arm64.tar.gz"
      sha256 "d11c214ed41fd84c44d6ea1cad55b0aea03d8ef4ec87a3d65f687b7cc7daf3b1"
    end
    on_intel do
      url "https://github.com/prime-radiant-inc/beeper-message-sync/releases/download/v#{version}/beeper-message-sync-darwin-x86_64.tar.gz"
      sha256 "13bbff4f3b93f9b46342217ca17e4e3018395ddf2c7491545d010dda6f827f99"
    end
  end

  def install
    on_macos do
      on_arm do
        bin.install "beeper-message-sync-darwin-arm64" => "beeper-message-sync"
      end
      on_intel do
        bin.install "beeper-message-sync-darwin-x86_64" => "beeper-message-sync"
      end
    end
  end

  service do
    run [opt_bin/"beeper-message-sync"]
    keep_alive true
    log_path var/"log/beeper-message-sync.log"
    error_log_path var/"log/beeper-message-sync.log"
  end

  def caveats
    <<~EOS
      Before starting the service, run setup:
        beeper-message-sync setup

      Then start the service:
        brew services start beeper-message-sync

      Logs are synced to: ~/Dropbox/Beeper-Sync/logs/
    EOS
  end
end
