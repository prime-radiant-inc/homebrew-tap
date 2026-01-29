class LlmProxy < Formula
  desc "Transparent logging proxy for LLM API traffic"
  homepage "https://github.com/prime-radiant-inc/llm-proxy"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/prime-radiant-inc/llm-proxy/releases/download/v#{version}/llm-proxy-darwin-arm64.tar.gz"
      sha256 "8e50a89ef1ddaabd09eaa8b046589e5d47d6bfdcdf7610448b1818648bf691d7"
    end
    on_intel do
      url "https://github.com/prime-radiant-inc/llm-proxy/releases/download/v#{version}/llm-proxy-darwin-amd64.tar.gz"
      sha256 "62fddb7b7d2e187aea22682709ba3215cb97ab5c6bdae30797a70710fa176dc1"
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
