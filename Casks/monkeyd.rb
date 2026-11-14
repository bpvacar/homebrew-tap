cask "monkeyd" do
  version "0.1.8"
  sha256 "597b5ff209693fcc54a4206e295d93130708527572817ca1c67231e5db5faba2"

  url "https://github.com/bpvacar/monkeyd/releases/download/v#{version}/MonkeyD_#{version}_universal.dmg"
  name "MonkeyD"
  desc "Markdown editor and viewer"
  homepage "https://github.com/bpvacar/monkeyd"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "MonkeyD.app"

  # MonkeyD is not notarized; without this Gatekeeper refuses to open it.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/MonkeyD.app"],
        writable_paths: ["{{appdir}}/MonkeyD.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.benjaminvaca.monkeyd",
    "~/Library/Caches/com.benjaminvaca.monkeyd",
    "~/Library/Preferences/com.benjaminvaca.monkeyd.plist",
    "~/Library/Saved Application State/com.benjaminvaca.monkeyd.savedState",
    "~/Library/WebKit/com.benjaminvaca.monkeyd",
  ]
end
