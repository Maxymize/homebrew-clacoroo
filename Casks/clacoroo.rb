cask "clacoroo" do
  version "1.2.18"

  on_arm do
    sha256 "1c87a108ecb0ed7181ec5b4b34fadf3d213a7fc3000d9797f32a5a3a4e08979b"

    url "https://github.com/Maxymize/clacoroo/releases/download/v#{version}/CLACOROO-#{version}-arm64.dmg",
        verified: "github.com/Maxymize/clacoroo/"
  end
  on_intel do
    sha256 "1ba7bc602f40c087063d0407edcdf0a37585c86d86a4abcfdcc2b0fc29199b58"

    url "https://github.com/Maxymize/clacoroo/releases/download/v#{version}/CLACOROO-#{version}-x64.dmg",
        verified: "github.com/Maxymize/clacoroo/"
  end

  name "CLACOROO"
  desc "Control room for Claude Code: manage plugins, skills, agents, MCP and hooks"
  homepage "https://clacoroo.app/"

  # L'app non è ancora firmata/notarizzata (Apple Developer ID in arrivo).
  # `auto_updates true` perché CLACOROO ha il proprio check-aggiornamenti via
  # GitHub Releases; evita che brew segnali falsi "outdated".
  auto_updates true
  depends_on :macos

  app "CLACOROO.app"

  # macOS mette in quarantena le app scaricate non notarizzate. Finché non è
  # firmata, rimuoviamo l'attributo di quarantena post-install così l'utente
  # non incappa nel blocco "app danneggiata / impossibile aprire" di Gatekeeper.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/CLACOROO.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/CLACOROO",
    "~/Library/Preferences/com.maxymize.clacoroo.plist",
    "~/Library/Saved Application State/com.maxymize.clacoroo.savedState",
  ]
end
