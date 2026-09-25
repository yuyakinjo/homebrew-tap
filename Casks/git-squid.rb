cask "git-squid" do
  version "2026.9.251611"
  sha256 "31da127ba18c53a9d075070d86a64397a5aaeef014eb750160f07d047767b4fd"

  url "https://github.com/yuyakinjo/git-squid/releases/download/v#{version}/GitSquid_#{version}_aarch64.zip"
  name "GitSquid"
  desc "Simple Git GUI with a GitKraken-style commit graph"
  homepage "https://github.com/yuyakinjo/git-squid"

  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "GitSquid.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/GitSquid.app"],
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
