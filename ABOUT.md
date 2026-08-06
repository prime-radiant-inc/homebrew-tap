# homebrew-tap

> Homebrew tap distributing Prime Radiant CLI tools as formulae and macOS apps as casks.

**Family:** plugins · **Type:** infra · **Lifecycle:** production · **Owner:** arittr

## What it does
A Homebrew tap holding two Ruby formulae under `Formula/`: `llm-proxy` (v0.7.0, a transparent LLM API logging proxy, installed as a brew service) and `beeper-message-sync` (v0.2.0, Beeper chat-history sync, installed as a brew service), plus one cask under `Casks/`: `clearance` (v1.3.5, the Clearance markdown-viewer macOS app, auto-updating). Each formula or cask downloads the corresponding repo's prebuilt macOS release artifact (arm64/amd64) and installs it.

## How it fits
- Depends on: [llm-proxy](https://github.com/prime-radiant-inc/llm-proxy), [beeper-message-sync](https://github.com/prime-radiant-inc/beeper-message-sync), and [clearance](https://github.com/prime-radiant-inc/clearance) — each formula/cask `url` points at that repo's GitHub release artifact and installs it; evidence: `Formula/llm-proxy.rb`, `Formula/beeper-message-sync.rb`, `Casks/clearance.rb`
- Used by: developers running `brew install` from this tap
- External: Homebrew, GitHub Releases

## Runtime & data
- Runs: not a service itself; defines brew formulae and casks (installed binaries run as brew services or apps on the user's machine)
- Data in: —
- Data out: installed CLI binaries (llm-proxy, beeper-message-sync) and the Clearance.app bundle

<!-- Maintained by the maintaining-project-map skill. Do not hand-edit; regenerated. -->
