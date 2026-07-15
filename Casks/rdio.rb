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
end
