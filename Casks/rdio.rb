cask "rdio" do
  arch arm: "arm64", intel: "x86_64"

  version "0.1.1"
  sha256 arm:   "14c041c6aba0736c5d65e118f149502b1ea44c4caa7e8c60bb185d44609e9fea",
         intel: "4bd7210a427f399db799c920b3b5160ce6f800a30986753b529c3d243951f403"

  url "https://github.com/AnvarAtayev/rdio/releases/download/v#{version}/Rdio-#{version}-#{arch}.zip"
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
