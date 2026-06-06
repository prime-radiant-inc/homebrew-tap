# homebrew-tap

> Homebrew tap distributing Prime Radiant CLI tools as installable formulae.

**Family:** plugins · **Type:** infra · **Lifecycle:** production · **Owner:** arittr

## What it does
A Homebrew tap holding two Ruby formulae under `Formula/`: `llm-proxy` (v0.7.0, a transparent LLM API logging proxy, installed as a brew service) and `beeper-message-sync` (v0.2.0, Beeper chat-history sync, installed as a brew service). Each formula downloads the corresponding repo's prebuilt macOS release tarball (arm64/amd64) and installs the binary.

## How it fits
- Depends on: [llm-proxy](https://github.com/prime-radiant-inc/llm-proxy) and [beeper-message-sync](https://github.com/prime-radiant-inc/beeper-message-sync) — each formula's `url` points at that repo's GitHub release tarball and installs its binary; evidence: `Formula/llm-proxy.rb`, `Formula/beeper-message-sync.rb`
- Used by: developers running `brew install` from this tap
- External: Homebrew, GitHub Releases

## Runtime & data
- Runs: not a service itself; defines brew formulae (installed binaries run as brew services on the user's machine)
- Data in: —
- Data out: installed CLI binaries (llm-proxy, beeper-message-sync)

<!-- Maintained by the maintaining-project-map skill. Do not hand-edit; regenerated. -->
