class LlmProxy < Formula
  desc "Transparent logging proxy for LLM API traffic"
  homepage "https://github.com/prime-radiant-inc/llm-proxy"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/prime-radiant-inc/llm-proxy/releases/download/v#{version}/llm-proxy-darwin-arm64.tar.gz"
      sha256 "83865098730fb61b8c13432c443671fcdcbb09194359ea3542b39b3949b45417"
    end
    on_intel do
      url "https://github.com/prime-radiant-inc/llm-proxy/releases/download/v#{version}/llm-proxy-darwin-amd64.tar.gz"
      sha256 "d2e957986f3b12f5391f60c3f7e1678cb14eb6633a6c3f4d49b1b74805ce6617"
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
