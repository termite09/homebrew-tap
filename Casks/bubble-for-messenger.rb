cask "bubble-for-messenger" do
  version "2.1.0"
  sha256 "90b1db2bff69423eb6a3acc2e3addd243f35f2cf51fcfa358d070faeaf5b16e2"

  url "https://github.com/termite09/bubble-for-messenger/releases/download/v#{version}/Bubble-#{version}-arm64.dmg"
  name "Bubble for Messenger"
  desc "Facebook Messenger as a floating chat head for macOS"
  homepage "https://github.com/termite09/bubble-for-messenger"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Bubble.app"

  caveats <<~EOS
    Bubble is not signed with an Apple developer certificate. Install with
    --no-quarantine, or right-click Bubble.app -> Open on the first launch.
  EOS

  zap trash: [
    "~/Library/Application Support/Bubble for Messenger",
    "~/Library/Preferences/com.termite09.bubble-for-messenger.plist",
    "~/Library/Saved Application State/com.termite09.bubble-for-messenger.savedState",
  ]
end
