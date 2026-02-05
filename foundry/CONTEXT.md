---
name: foundry
description: TSMC, Samsung, Intel foundry operations. Process nodes, packaging, capacity.
---

# Foundry Context Pack

## When to Load

- TSMC analysis
- Process technology comparisons
- Advanced packaging (CoWoS, chiplets)
- Foundry capacity and pricing

## Market Structure

### Revenue Share (2024)

| Foundry | Share | Specialty |
|---------|-------|-----------|
| TSMC | ~60% | Leading-edge logic |
| Samsung | ~12% | Memory + logic |
| GlobalFoundries | ~6% | Mature nodes, RF |
| UMC | ~6% | Mature nodes |
| SMIC | ~5% | China domestic |
| Intel Foundry | ~1% | Ramping |

### Leading-Edge Reality

At <7nm, TSMC has ~90% share. "Competition" is largely theoretical.

## TSMC Deep Dive

### Node Roadmap

| Node | Status | Key Customers |
|------|--------|---------------|
| N7 | Mature | Broad |
| N5 | Volume | Apple, AMD, NVIDIA, Qualcomm |
| N4/N4P | Volume | Apple, NVIDIA, AMD |
| N3/N3E | Ramping | Apple, Intel, AMD |
| N3P | 2024 | MediaTek, Qualcomm |
| N2 | 2025 | Apple (first) |
| A16 | 2026 | TBD |

### Pricing (Approximate)

| Node | Wafer Cost | Per mm² |
|------|------------|---------|
| N7 | $10K | $0.10 |
| N5 | $17K | $0.17 |
| N3 | $20K+ | $0.20+ |

Prices rise ~20% per generation, but transistor density increases offset partially.

### Geographic Footprint

| Location | Nodes | Status |
|----------|-------|--------|
| Taiwan (Hsinchu, Tainan) | All | HQ, leading-edge |
| Arizona | N4, N3 | Fab 21 ramping |
| Japan (Kumamoto) | N28, N12/16 | JASM JV |
| Germany | Mature | Planned |

## Advanced Packaging

### CoWoS (Chip-on-Wafer-on-Substrate)

TSMC's 2.5D packaging for HBM integration:

| Variant | Use Case |
|---------|----------|
| CoWoS-S | Standard, silicon interposer |
| CoWoS-R | RDL interposer (lower cost) |
| CoWoS-L | Local silicon interconnect |

**Capacity constraint**: CoWoS is the bottleneck for AI chips, not logic wafers.

### SoIC (3D Stacking)

Vertical die stacking for chiplets. Used in AMD's 3D V-Cache.

## Samsung Foundry

### Challenges

- Yield issues at 3nm GAA
- Customer losses (Qualcomm, NVIDIA)
- Reputation damage

### Strengths

- Memory integration expertise
- Aggressive pricing
- Korea government support

## Intel Foundry

### Turnaround Attempt

| Node | Intel Name | Competitor Equivalent | Status |
|------|------------|----------------------|--------|
| Intel 7 | — | N7/N6 | Volume |
| Intel 4 | — | N5 | Ramping |
| Intel 3 | — | N3 | 2024 |
| Intel 20A | — | N2 | 2024 |
| Intel 18A | — | Beyond N2 | 2025 |

### External Customer Progress

- Microsoft: Announced, unconfirmed volume
- Others: Mostly wait-and-see

## Key Metrics

| Metric | What It Tells You |
|--------|-------------------|
| **Wafer shipments** | Volume/utilization |
| **ASP/wafer** | Mix, pricing power |
| **Capex** | Future capacity |
| **Lead time** | Demand strength |
| **Yield** | Technology maturity |

## Data Sources

- TSMC earnings calls (detailed guidance)
- Equipment vendor earnings (ASML, Applied)
- SemiAnalysis foundry model
