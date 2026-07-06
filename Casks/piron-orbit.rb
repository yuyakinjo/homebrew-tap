cask "piron-orbit" do
  version "2026.7.6"
  sha256 "8dfa522b6beb27fd08c42a37305b5f894ac629894bcd23decfe163e898a7380a"

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
