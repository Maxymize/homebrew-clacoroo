# homebrew-clacoroo

Homebrew tap per **[CLACOROO](https://clacoroo.app)** — il control room desktop per Claude Code (gestione plugin, skill, agent, marketplace, MCP e hooks senza CLI).

## Install

```bash
brew install --cask maxymize/clacoroo/clacoroo
```

Oppure aggiungi il tap una volta e poi installa:

```bash
brew tap maxymize/clacoroo
brew install --cask clacoroo
```

## Update

```bash
brew update && brew upgrade --cask clacoroo
```

`brew update` refreshes the cask definition first (so Homebrew sees the new version), then `brew upgrade` installs it. Without `brew update`, Homebrew may report "already installed" even when a newer version exists.

## Uninstall

```bash
brew uninstall --cask clacoroo
# rimuovere anche dati/preferenze:
brew uninstall --zap --cask clacoroo
```

## Nota sulla firma (temporanea)

CLACOROO non è ancora firmata con Apple Developer ID (notarization in arrivo). Il cask rimuove automaticamente l'attributo di quarantena dopo l'installazione, così l'app si apre senza il blocco di Gatekeeper. Quando la notarization sarà attiva, questo passaggio diventerà superfluo e punteremo al cask Homebrew ufficiale.

---

CLACOROO è un tool indipendente di terze parti, non affiliato né approvato da Anthropic, PBC. © 2026 MAXYMIZE — AGPL-3.0-or-later.
