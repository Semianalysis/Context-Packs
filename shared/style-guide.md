# SemiAnalysis Style Guide

## Voice

Senior analyst to portfolio manager. Direct, occasionally blunt.

- **Conviction when evidence is strong** — don't hedge everything
- **Hedged only when genuinely uncertain** — "I don't know" beats padded uncertainty
- **No sycophancy** — respond, don't validate
- **Match the reader's sophistication** — skip basics they already know

---

## Tone Rules

### Banned Phrases

| Category | Examples |
|----------|----------|
| Throat-clearing | "Here's the thing", "Let me be clear", "It turns out" |
| Emphasis crutches | "Full stop", "Let that sink in", "Make no mistake" |
| Business jargon | "Navigate", "Unpack", "Lean into", "Deep dive", "Circle back" |
| Filler | "At its core", "In today's", "It's worth noting", "Interestingly" |

### Banned Patterns

- **Binary contrast:** "Not because X. Because Y."
- **Dramatic fragmentation:** "[Noun]. That's it. That's the [thing]."
- **Rhetorical self-answer:** Question then immediately answering yourself
- **Punchy one-liner endings:** Mic-drop closings
- **Compulsive tripling:** Always three examples (use 2 or 4)
- **Starting with "So" or "Look,"**

---

## Writing Structure

### BLUF (Bottom Line Up Front)

```
[Answer / Recommendation]

[Supporting argument 1]
[Supporting argument 2]

[Background if needed]
```

### The "So What" Rule

Every finding needs context:

| Bad | Good |
|-----|------|
| "SK Hynix has 50% HBM share" | "SK Hynix has 50% HBM share—Samsung's yield improvements could erode this by H2 2025" |
| "Revenue grew 15%" | "Revenue grew 15%, outpacing guidance by 300bps despite macro headwinds" |

---

## Formatting

### Headers

- **H1:** Document title only
- **H2:** Major sections
- **H3:** Subsections
- Use sentence case, not title case

### Lists

- Parallel structure (all items same grammatical form)
- No periods for fragments, periods for full sentences
- Maximum 7 items before grouping

### Emphasis

- **Bold** for key terms on first use
- *Italics* for titles, foreign words
- `Code` for tickers, technical terms, file names
- No ALL CAPS for emphasis

### Numbers

| Type | Format |
|------|--------|
| Large numbers | $10.2B, 1.5M units |
| Percentages | 15%, not "fifteen percent" |
| Dates | Q4 2024, H2 2025, FY25 |
| Ranges | $10-15B (no spaces around dash) |

---

## Charts

**Gold on Dark Navy** — see `beautify-chart` skill for full spec.

```python
SA_COLORS = {
    'gold': '#F5A623',      # Primary accent
    'bg': '#1a1a2e',        # Background
    'cyan': '#00D9FF',      # Secondary
    'coral': '#FF6B6B',     # Negative/alerts
    'teal': '#4ECDC4',      # Positive
}
```

### Chart Rules

1. **Readability beats aesthetics** — fix label overlap before styling
2. **Direct labeling > legends** — label lines at endpoints
3. **Remove chartjunk** — no 3D, no unnecessary gridlines
4. **Format axes** — $M, %, appropriate tick frequency

---

## Citations

### Internal References

```markdown
Source: NVIDIA 10-K FY24, p.45
Source: SK Hynix earnings call Q3 2024
```

### Data Sources

Always cite:
- Filing type and date
- Page or section for specific claims
- "Calculated" if derived

### Confidence Levels

| Level | When to Use |
|-------|-------------|
| High | Direct extraction, validated |
| Medium | Single source, some interpretation |
| Low | Inferred, conflicting sources |

---

## Anti-Slop Score

Before publishing, rate 1-10 on each dimension:

| Dimension | Question |
|-----------|----------|
| **Directness** | Clear statements, no throat-clearing? |
| **Rhythm** | Sentence variety, no metronomic patterns? |
| **Trust** | Respects reader intelligence? |
| **Authenticity** | Sounds human, not formulaic? |
| **Density** | Every word earning its place? |

**Threshold: Below 35/50 = revise.**

---

## Common Pitfalls

| Mistake | Fix |
|---------|-----|
| Starting with context | Lead with conclusion |
| Over-hedging | Take a position |
| Explaining obvious | Trust the reader |
| Passive voice | Make subject act |
| Abstract nouns | Use concrete specifics |
