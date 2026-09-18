cask "bubble-for-messenger" do
  version "3.0.1"
  sha256 "35e15bdd7e728dc5d894f511344ae8d5a746852d654fa4363555a4b29cb2f78f"

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
