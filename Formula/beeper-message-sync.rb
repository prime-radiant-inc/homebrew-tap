class BeeperMessageSync < Formula
  desc "Sync Beeper chat history to local storage"
  homepage "https://github.com/prime-radiant-inc/beeper-message-sync"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/prime-radiant-inc/beeper-message-sync/releases/download/v#{version}/beeper-message-sync-darwin-arm64.tar.gz"
      sha256 "ca5893b3aeeec81ec894223d44057d981bf16be9e652c60ca6ea26e3cb588e8c"
    end
    on_intel do
      url "https://github.com/prime-radiant-inc/beeper-message-sync/releases/download/v#{version}/beeper-message-sync-darwin-x86_64.tar.gz"
      sha256 "516a26712e2019840d429bf720eb4f625b07226415ec326e39c2aa38bb77c3d1"
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
