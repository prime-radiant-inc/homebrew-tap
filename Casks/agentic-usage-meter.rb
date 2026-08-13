cask "agentic-usage-meter" do
  version "0.2.5"
  sha256 "479836893b303e7def76a871ff9da44a51716ee59058b65f6976d2df44707fbb"

  url "https://github.com/prime-radiant-inc/agentic-usage-meter/releases/download/v#{version}/Agentic-Usage-Meter-#{version}.zip"
  name "Agentic Usage Meter"
  desc "Menu-bar meter for coding-agent subscription quotas"
  homepage "https://github.com/prime-radiant-inc/agentic-usage-meter"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :tahoe

  app "Agentic Usage Meter.app"
end
