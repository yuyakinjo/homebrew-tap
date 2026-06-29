cask "piron-orbit" do
  version "2026.6.30"
  sha256 "4dc43ca8895d0eaac20dc72cb91798d8d5982cb928de696ade21d07918aaefc5"

  url "https://github.com/yuyakinjo/homebrew-tap/releases/download/piron-orbit-v#{version}/Piron-Orbit_#{version}_aarch64.zip"
  name "Piron Orbit"
  desc "Git workflow controller"
  homepage "https://github.com/yuyakinjo/homebrew-tap"

  depends_on macos: :big_sur
  depends_on arch: :arm64

  app "Piron Orbit.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/Piron Orbit.app"],
                   print_stderr: false
  end

  zap trash: [
    "~/Library/Application Support/Piron Orbit",
    "~/Library/Caches/com.yuyakinjo.piron-orbit",
    "~/Library/Preferences/com.yuyakinjo.piron-orbit.plist",
    "~/Library/Saved Application State/com.yuyakinjo.piron-orbit.savedState",
  ]
end
