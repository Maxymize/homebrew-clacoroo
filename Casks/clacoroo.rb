cask "clacoroo" do
  version "1.1.29"

  on_arm do
    sha256 "dc7d7b0da6caca5fe33c93d4a71f0d6baf6f10c7d65fb9d83bd0e116fb790b28"

    url "https://github.com/Maxymize/clacoroo/releases/download/v#{version}/CLACOROO-#{version}-arm64.dmg",
        verified: "github.com/Maxymize/clacoroo/"
  end
  on_intel do
    sha256 "ac713b135ba7c2c17130123a5af04f89cc2b5a47d9fdc6c2f6c514fda625a1bd"

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
