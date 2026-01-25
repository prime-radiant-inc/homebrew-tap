class LlmProxy < Formula
  desc "Transparent logging proxy for LLM API traffic"
  homepage "https://github.com/prime-radiant-inc/llm-proxy"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/prime-radiant-inc/llm-proxy/releases/download/v#{version}/llm-proxy-darwin-arm64.tar.gz"
      sha256 "88f4df284a33587e733e45df0035f6465e18add6c7212eb001e17cd0835538f3"
    end
    on_intel do
      url "https://github.com/prime-radiant-inc/llm-proxy/releases/download/v#{version}/llm-proxy-darwin-amd64.tar.gz"
      sha256 "2973d3e8fb0a376c036c09d30fb32645f48323fe5e9e7d2ecaafedbe34298c7b"
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
