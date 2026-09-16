cask "bubble-for-messenger" do
  version "2.7.0"
  sha256 "77ed6625d8c578393b6e7f1c40290cc36d67c9cd6b10005cdce6cf4c783cbe88"

  url "https://github.com/termite09/bubble-for-messenger/releases/download/v#{version}/Bubble-#{version}-arm64.dmg"
  name "Bubble for Messenger"
  desc "Facebook Messenger as a floating chat head"
  homepage "https://github.com/termite09/bubble-for-messenger"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :big_sur

  app "Bubble.app"

  uninstall quit: "com.termite09.bubble-for-messenger"

  zap trash: [
    "~/Library/Application Support/Bubble for Messenger",
    "~/Library/Preferences/com.termite09.bubble-for-messenger.plist",
    "~/Library/Saved Application State/com.termite09.bubble-for-messenger.savedState",
  ]

  caveats <<~CAVEATS
    Bubble is not signed with an Apple developer certificate, so macOS blocks
    the first launch. Right-click Bubble.app in Applications -> Open -> Open,
    or clear the quarantine flag once:
      xattr -d com.apple.quarantine /Applications/Bubble.app
  CAVEATS
end
