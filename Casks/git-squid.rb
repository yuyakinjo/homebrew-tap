cask "git-squid" do
  version "2026.9.251807"
  sha256 "1c20a45df1e343beba49276257d68696f46d1e2aebae65a7f2a1c151f869465b"

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
