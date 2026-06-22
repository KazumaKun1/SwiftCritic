# DESIGN.md — SwiftCritic

## Philosophy

SwiftCritic is a tool for developers, so the UI should feel like one. The visual language is **native iOS first, dark-forward, with a warm retro-terminal influence** — not a costume, but a quiet nod. Think amber CRT monitor, not Matrix. The code is the hero; the UI gets out of the way.

**Principles:**
- Use native SwiftUI components and system behaviors wherever possible. Never fight the platform.
- Dark mode is the primary experience. Light mode is supported and clean, not an afterthought.
- SF Symbols only — no third-party icon sets.
- The amber accent color does the heavy lifting for personality. Everything else is restrained.

---

## Color Palette

All base surfaces use iOS semantic system colors so they adapt correctly to both modes automatically.

### Surfaces

| Token | Light | Dark | Usage |
|-------|-------|------|-------|
| `Color(.systemBackground)` | `#FFFFFF` | `#000000` | Primary background |
| `Color(.secondarySystemBackground)` | `#F2F2F7` | `#1C1C1E` | Cards, sheets, grouped content |
| `Color(.tertiarySystemBackground)` | `#FFFFFF` | `#2C2C2E` | Inset sections, nested cards |
| `Color(.separator)` | system | system | Dividers |

### Accent — Amber

The single custom color in the system. Warm golden amber referencing amber-phosphor CRT terminals. Used sparingly for interactive elements, highlights, and focus states.

```swift
extension Color {
    static let scAmber = Color("Amber")
    // Light: #E6950A
    // Dark:  #F5A623
}
```

Add `Amber` as a Color Set in `Assets.xcassets` with both appearances defined.

Use amber for: primary buttons, selected states, highlighted line indicators, active tab indicators, streak counters, score accents.

Do NOT use amber for: body text, backgrounds, semantic states (success/error/warning have their own colors).

### Semantic Colors

Use system colors for all result and status states — they already handle both appearances.

| State | Color | Usage |
|-------|-------|-------|
| Caught (correct) | `Color(.systemGreen)` | ✅ issues the user found |
| Missed | `Color(.systemRed)` | ❌ issues the user didn't flag |
| False positive | `Color(.systemOrange)` | ⚠️ things flagged that weren't issues |
| Destructive | `Color(.systemRed)` | Delete, clear actions |
| Inactive / disabled | `Color(.tertiaryLabel)` | Dimmed states |

### Text

| Token | Usage |
|-------|-------|
| `Color(.label)` | Primary text |
| `Color(.secondaryLabel)` | Subtitles, supporting text |
| `Color(.tertiaryLabel)` | Timestamps, metadata, placeholders |
| `Color(.quaternaryLabel)` | Extremely dim context |

---

## Typography

All typefaces are system fonts — no imports, no custom fonts.

| Role | Font | Size | Weight |
|------|------|------|--------|
| Large title | SF Pro | 34pt | Bold |
| Title | SF Pro | 28pt | Bold |
| Headline | SF Pro | 17pt | Semibold |
| Body | SF Pro | 17pt | Regular |
| Subheadline | SF Pro | 15pt | Regular |
| Caption | SF Pro | 12pt | Regular |
| **Code** | **SF Mono** | **14pt** | **Regular** |
| Code keyword | SF Mono | 14pt | Medium |

Always use `.font(.system(...))` or SwiftUI text styles (`.title`, `.headline`, etc.) with Dynamic Type support. Never hardcode font sizes without `@ScaledMetric`.

**Code display:** All code snippets use SF Mono at 14pt. Apply `.monospacedDigit()` for line numbers. Use `Color(.label)` as the base code color — syntax highlighting is additive on top.

---

## Code Display

Code snippets are the primary content of the app. They should be readable and feel like a lightweight editor, not a `Text` dump.

- Background: `Color(.secondarySystemBackground)`
- Font: SF Mono 14pt, `Color(.label)`
- Line numbers: SF Mono 12pt, `Color(.tertiaryLabel)`, right-aligned in a fixed-width gutter
- Line height: 1.6× for readability
- Horizontal padding: 16pt; vertical padding: 12pt
- Corner radius: 12pt (matches iOS card style)
- Highlighted line (user-selected): amber tint at 15% opacity as background, amber left border (2pt)

Minimal syntax highlighting (v1 — optional):
- Keywords: `Color(.systemPink)` or `Color(.systemPurple)`
- Strings: `Color(.systemOrange)`
- Comments: `Color(.tertiaryLabel)`
- Numbers: `Color(.systemBlue)`

---

## Components

### Buttons

**Primary (CTA):**
- Background: `scAmber`
- Text: `Color(.systemBackground)` (black in dark mode — high contrast on amber)
- Corner radius: 12pt
- Height: 50pt
- Font: Headline (semibold 17pt)

**Secondary / Outlined:**
- Background: clear
- Border: `Color(.separator)`, 1pt
- Text: `Color(.label)`
- Corner radius: 12pt

**Destructive:**
- Background: clear
- Text: `Color(.systemRed)`
- No border

Never use the default blue tint as a primary action — amber is the brand action color.

### Cards

- Background: `Color(.secondarySystemBackground)`
- Corner radius: 16pt
- No drop shadow in dark mode; subtle shadow in light mode (`shadowRadius: 2, opacity: 0.08`)
- Padding: 16pt all sides

### Difficulty Badges

Pill-shaped labels shown on challenge cards and history items.

| Difficulty | Color |
|------------|-------|
| Easy | `Color(.systemGreen)` at 15% opacity background, full opacity text |
| Medium | `Color(.systemOrange)` at 15% opacity background, full opacity text |
| Hard | `Color(.systemRed)` at 15% opacity background, full opacity text |

Corner radius: 8pt. Font: Caption semibold, all caps.

### Inline Comment Indicator

When a user highlights a line in the review screen:
- Amber left border (2pt) on the highlighted line
- Amber dot + comment count badge in the gutter
- Comment sheet: `.sheet` presentation, `detents: [.medium]`

### Result Buckets

Each bucket (Caught / Missed / False Positive) is a collapsible section:
- Section header: semantic color (green / red / orange) + SF Symbol icon + count
- Items inside: card style, `Color(.secondarySystemBackground)` background
- Expand/collapse with `DisclosureGroup`

---

## Spacing & Layout

Use the standard 8pt grid throughout.

| Token | Value | Usage |
|-------|-------|-------|
| `spacing.xs` | 4pt | Tight inline spacing |
| `spacing.sm` | 8pt | Between related elements |
| `spacing.md` | 16pt | Standard padding, card insets |
| `spacing.lg` | 24pt | Section gaps |
| `spacing.xl` | 32pt | Screen-level breathing room |

Safe area insets are always respected. Never place interactive elements under the home indicator.

---

## Icons

SF Symbols only. Match symbol weight to the text weight of adjacent labels.

| Context | Symbol |
|---------|--------|
| Easy difficulty | `gauge.with.dots.needle.33percent` |
| Medium difficulty | `gauge.with.dots.needle.50percent` |
| Hard difficulty | `gauge.with.dots.needle.100percent` |
| Caught issue | `checkmark.circle.fill` |
| Missed issue | `xmark.circle.fill` |
| False positive | `exclamationmark.triangle.fill` |
| Inline comment | `text.bubble` |
| Overall comment | `doc.text` |
| History | `clock.arrow.trianglehead.counterclockwise.rotate.90` |
| Streak | `flame.fill` |
| Score | `star.fill` |
| Category — Naming | `textformat` |
| Category — Logic | `arrow.triangle.branch` |
| Category — Security | `lock` |
| Category — Memory | `memorychip` |
| Category — Architecture | `square.3.layers.3d` |

---

## Motion & Animation

Keep animations native and purposeful. Never animate for decoration.

- Use `.animation(.spring(response: 0.3, dampingFraction: 0.7))` for state transitions
- Result reveal: stagger bucket sections appearing with `.transition(.move(edge: .bottom).combined(with: .opacity))`
- Inline comment sheet: standard `.sheet` — no custom transitions
- Score counter: animate the number counting up on result screen appear

---

## Dark vs Light Mode

Dark mode is primary. Design all screens dark-first, then verify light mode looks clean.

- Never use hardcoded hex colors in SwiftUI views — always use semantic system colors or the `scAmber` asset so both modes work automatically
- In light mode, amber shifts slightly deeper (`#E6950A`) for contrast — handled by the Color Set
- Code blocks in light mode use `Color(.secondarySystemBackground)` (light gray) — still readable, slightly differentiated from the white background
