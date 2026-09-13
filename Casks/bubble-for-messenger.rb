cask "bubble-for-messenger" do
  version "2.1.0"
  sha256 "0ecdf39bc26b40ac73d83160fe30d5c7b21bc4119e767959629e993f0f863d1d"

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
