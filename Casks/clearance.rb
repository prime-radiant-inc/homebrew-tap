cask "clearance" do
  version "1.3.5"
  sha256 "0888212df004fdac4d1e6707e396b56f0440931f57b7ca513f5702841882e841"

  url "https://github.com/prime-radiant-inc/clearance/releases/download/v#{version}/Clearance-#{version}-macOS.zip"
  name "Clearance"
  desc "Markdown viewer"
  homepage "https://github.com/prime-radiant-inc/clearance"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "Clearance.app"
end
