cask "git-squid" do
  version "2026.10.81511"
  sha256 "e12d768a1aea536458911a32b0f8874d47d335e17d25d83eeedb5a5510027801"

  url "https://github.com/yuyakinjo/homebrew-tap/releases/download/git-squid-v#{version}/GitSquid_#{version}_aarch64.zip"
  name "GitSquid"
  desc "Simple Git GUI with a GitKraken-style commit graph"
  homepage "https://github.com/yuyakinjo/homebrew-tap"

  depends_on arch: :arm64
  depends_on :macos

  app "GitSquid.app"

  postflight_steps do
    run "/usr/bin/xattr",
        args:         ["-dr", "com.apple.quarantine", "{{appdir}}/GitSquid.app"],
        must_succeed: false,
        print_stderr: false
  end

  zap trash: [
    "~/Library/Application Support/dev.gitsquid.app",
    "~/Library/Caches/dev.gitsquid.app",
    "~/Library/Logs/dev.gitsquid.app",
    "~/Library/Preferences/dev.gitsquid.app.plist",
    "~/Library/Saved Application State/dev.gitsquid.app.savedState",
    "~/Library/WebKit/dev.gitsquid.app",
  ]
end
