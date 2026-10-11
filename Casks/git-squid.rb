cask "git-squid" do
  version "2026.10.110921"
  sha256 "bcd02a323ab4b2f9c1a5d599c7325231a0626deb50852e3436c03b74c5d0a15d"

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
