cask "git-squid" do
  version "2026.11.161525"
  sha256 "599dd1e22c0d553dd123a9236bb1c5685270071d6e24e4448ba6f6b41d306358"

  url "https://github.com/yuyakinjo/homebrew-tap/releases/download/git-squid-v#{version}/GitSquid_#{version}_aarch64.zip"
  name "GitSquid"
  desc "Simple Git GUI with a GitKraken-style commit graph"
  homepage "https://github.com/yuyakinjo/homebrew-tap"

  # 入れたあとはアプリ内更新で上がるので、brew upgrade (--greedy なし) では触らない
  auto_updates true
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
