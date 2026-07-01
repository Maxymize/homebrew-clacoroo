cask "clacoroo" do
  version "1.2.1"

  on_arm do
    sha256 "252d1b9e3c647a82e3ae3f915cfa66139e60e76a38c0e44a436813aaf94dea16"

    url "https://github.com/Maxymize/clacoroo/releases/download/v#{version}/CLACOROO-#{version}-arm64.dmg",
        verified: "github.com/Maxymize/clacoroo/"
  end
  on_intel do
    sha256 "25393cff32a27b2f504c70608fe2f11d5f9ff78498bd4d01cdeab6ebadfb7b75"

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
