class LlmProxy < Formula
  desc "Transparent logging proxy for LLM API traffic"
  homepage "https://github.com/prime-radiant-inc/llm-proxy"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/prime-radiant-inc/llm-proxy/releases/download/v#{version}/llm-proxy-darwin-arm64.tar.gz"
      sha256 "ae08ef1fb100a5d67aa0ebf554849fa2e6eef82f4122609da3fb0b5d63beacc2"
    end
    on_intel do
      url "https://github.com/prime-radiant-inc/llm-proxy/releases/download/v#{version}/llm-proxy-darwin-amd64.tar.gz"
      sha256 "14e21dd1f588da3eeee6d43c3822163f1341cb1ca6b0c1e06525a0b03a27764a"
    end
  end

  def install
    on_macos do
      on_arm do
        bin.install "llm-proxy-darwin-arm64" => "llm-proxy"
      end
      on_intel do
        bin.install "llm-proxy-darwin-amd64" => "llm-proxy"
      end
    end
  end

  service do
    run [opt_bin/"llm-proxy", "--service"]
    keep_alive true
    log_path var/"log/llm-proxy.log"
    error_log_path var/"log/llm-proxy.log"
  end

  def post_install
    system bin/"llm-proxy", "--setup-shell"
  end

  def caveats
    <<~EOS
      To start llm-proxy now and restart at login:
        brew services start llm-proxy

      Then restart your shell or run:
        eval "$(llm-proxy --env)"

      Logs are stored in: ~/.llm-provider-logs/
    EOS
  end
end
