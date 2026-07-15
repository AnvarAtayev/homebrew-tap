cask "rdio" do
  # Rdio ships a single universal build; the SHA-256 is printed in each
  # release's summary (or run `brew bump-cask-pr rdio` to update both fields).
  version "0.1.3"
  sha256 "18ce590f9c291f35e43d7f5462a0bfb589cba9efd7cc63ff0a50779f2665ee64"

  url "https://github.com/AnvarAtayev/rdio/releases/download/v#{version}/Rdio-#{version}.zip"
  name "Rdio"
  desc "Tiny menu bar radio player"
  homepage "https://github.com/AnvarAtayev/rdio"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "Rdio.app"

  zap trash: [
    "~/Library/Application Support/Rdio",
    "~/Library/Preferences/dev.anvar.rdio.plist",
    "~/Library/Saved Application State/dev.anvar.rdio.savedState",
  ]

  caveats <<~EOS
    Rdio is ad-hoc signed and not notarized, so on first launch macOS Gatekeeper
    blocks it with "Apple could not verify Rdio is free of malware". This is
    expected. To open it, either:

      - Open System Settings -> Privacy & Security and click "Open Anyway"
        next to the Rdio message, or
      - Remove the quarantine flag:

          xattr -d com.apple.quarantine "#{appdir}/Rdio.app"
  EOS
end
