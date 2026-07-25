cask "clacoroo" do
  version "1.2.5"

  on_arm do
    sha256 "947086ff0c040ae5cebf241c78de48948815f7a99172ad904ccb5a75eb06e40f"

    url "https://github.com/Maxymize/clacoroo/releases/download/v#{version}/CLACOROO-#{version}-arm64.dmg",
        verified: "github.com/Maxymize/clacoroo/"
  end
  on_intel do
    sha256 "919c8badcc5fc5fdd946429dd534c6e479e259d54ec23bc0ce27ec79463ffec8"

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
