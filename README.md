# bpvacar/tap

Homebrew casks for apps by Benjamín Vaca.

```bash
brew install bpvacar/tap/monkeyd
```

| Cask | App |
|---|---|
| `monkeyd` | [MonkeyD](https://github.com/bpvacar/monkeyd), a markdown editor and viewer for macOS |

The apps are not notarized by Apple. Each cask clears the quarantine flag after
installing so macOS opens the app without the "unidentified developer" warning.

A scheduled workflow (`.github/workflows/bump.yml`) moves each cask to its app's
latest release every three hours.
