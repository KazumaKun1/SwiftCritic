# SwiftCritic

A native iOS app for practicing code review skills. Review AI-generated Swift code snippets, submit your findings, and get structured feedback on what you caught, missed, and misidentified.

Fully offline — powered by Apple's on-device Foundation Models framework. No account, no API key, no data leaving your device.

---

> **⚠️ Foundation Models Constraint**
>
> This app targets Apple's on-device Foundation Models framework (iOS 26+), which runs a ~3B parameter model. Through extensive testing during development, it became clear that this model cannot reliably generate intentionally flawed Swift code or consistently evaluate user reviews. The AI output is non-deterministic — some runs produce correct results, others hallucinate issues, contradict themselves within a single response, or trigger Apple's content guardrails on legitimate developer content.
>
> This project is shipped and documented honestly as an exploration of what the current Foundation Models framework can and cannot do for a developer tooling use case. The architecture is forward-compatible — when Apple ships an improved on-device model in a future iOS release, the app benefits without requiring architectural changes.
>
> See [PRD.md](PRD.md) for a detailed breakdown of observed failure modes and root cause analysis.

---

## Features

- **AI-generated challenges** — Swift code snippets with intentional issues, generated on-device
- **Three difficulty levels** — Easy (obvious, single issue) to Hard (multiple hidden issues requiring reasoning)
- **Five categories** — Naming, Logic, Security, Memory, Architecture
- **Inline + overall feedback** — Highlight specific lines to comment on, with an optional overall summary
- **Structured results** — See exactly what you caught, what you missed, and any false positives
- **Progress tracking** — Local scoring history and category breakdowns via SwiftData

---

## Requirements

- iOS 26+
- Xcode 26+
- Device with Apple Silicon (for on-device model inference)

---

## Getting Started

1. Clone the repo
   ```bash
   git clone https://github.com/KazumaKun1/SwiftCritic.git
   ```
2. Open `SwiftCritic.xcodeproj` in Xcode
3. Select your target device or simulator
4. Build and run (`Cmd + R`)

No additional setup required — Foundation Models runs entirely on-device.

---

## Architecture

- **Foundation Models** — on-device LLM for code generation and review evaluation (two-turn session)
- **SwiftData** — local persistence for session history and scores
- **Swift Testing** — unit tests for generation/evaluation logic
- **XCTest** — UI tests for the review flow

---

## Roadmap

### v1
- [x] Project setup
- [ ] Challenge configuration screen
- [ ] Review screen with inline commenting
- [ ] Result screen with caught / missed / false positive buckets
- [ ] SwiftData scoring and history

### v2
- [ ] Playbook reference screen
- [ ] Multi-file challenge simulation
- [ ] "Practice Weak Areas" smart category selection
- [ ] iCloud sync via CloudKit

---

## License

MIT
