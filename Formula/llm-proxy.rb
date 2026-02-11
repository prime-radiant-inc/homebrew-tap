class LlmProxy < Formula
  desc "Transparent logging proxy for LLM API traffic"
  homepage "https://github.com/prime-radiant-inc/llm-proxy"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/prime-radiant-inc/llm-proxy/releases/download/v#{version}/llm-proxy-darwin-arm64.tar.gz"
      sha256 "4a678e0a5075ae732ba50890924d38bc7be6b2f6c48241a5c7fffd40397a8f29"
    end
    on_intel do
      url "https://github.com/prime-radiant-inc/llm-proxy/releases/download/v#{version}/llm-proxy-darwin-amd64.tar.gz"
      sha256 "a63ab979c23cae8b59a7b6937e3cd31892777167a07d5781754df4fabbfae818"
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
