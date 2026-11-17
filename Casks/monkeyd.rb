cask "monkeyd" do
  version "0.1.10"
  sha256 "7e55dbe863c58bdfbf50b8a6a056d17a561a9e1e7db23c5eb1ccb515dbe32f54"

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
