---
name: memory
description: DRAM, NAND, and HBM deep dive. Pricing, capacity, technology transitions.
---

# Memory Context Pack

## When to Load

- Memory company analysis (Samsung, SK Hynix, Micron)
- HBM supply/demand
- DRAM/NAND pricing trends
- AI infrastructure memory requirements

## Memory Types

| Type | Use Case | Volatility | Key Players |
|------|----------|------------|-------------|
| **DRAM** | System memory, working data | Volatile | Samsung, SK Hynix, Micron |
| **NAND** | Storage (SSDs) | Non-volatile | Samsung, Kioxia/WD, SK Hynix, Micron |
| **HBM** | AI accelerators, high-bandwidth | Volatile | SK Hynix, Samsung, Micron |

## HBM Deep Dive

### Generations

| Gen | Bandwidth | Capacity/Stack | Status |
|-----|-----------|----------------|--------|
| HBM2 | 307 GB/s | 8GB | Legacy |
| HBM2E | 460 GB/s | 16GB | Mature |
| HBM3 | 665 GB/s | 24GB | Volume |
| HBM3E | 1.15 TB/s | 36GB | Ramping |
| HBM4 | 1.5+ TB/s | 48GB+ | 2025+ |

### HBM Market Share (2024)

| Company | Share | Key Customer |
|---------|-------|--------------|
| SK Hynix | ~50% | NVIDIA (exclusive for H100/H200) |
| Samsung | ~40% | AMD, Google |
| Micron | ~10% | NVIDIA (B100+) |

### HBM Economics

- **ASP**: ~$100/GB (vs $3-5/GB for DDR5)
- **Margin**: 50-60% gross (vs 30-40% for commodity DRAM)
- **Capacity constraint**: CoWoS packaging, not DRAM wafers

## DRAM Dynamics

### Technology Nodes

| Node | Status | Leaders |
|------|--------|---------|
| 1α (14-15nm) | Volume | All |
| 1β (12-13nm) | Ramping | Samsung, SK Hynix |
| 1γ (10-11nm) | Development | All |

### Pricing Cycles

DRAM is deeply cyclical:
- **Upcycle**: Supply tight, ASPs rise, margins expand
- **Downcycle**: Oversupply, ASPs fall, losses possible

Key indicators:
- Inventory weeks (>6 weeks = oversupply)
- Capex announcements (cuts = discipline)
- Contract vs spot spread

## NAND Dynamics

### Technology

| Layers | Status | Leaders |
|--------|--------|---------|
| 128L | Mature | All |
| 176L | Volume | Micron, SK Hynix |
| 200L+ | Ramping | Samsung, Micron |
| 300L+ | Development | All |

### Bit Growth vs Demand

NAND oversupply is structural:
- Bit growth: 30-40% annually
- Demand growth: 20-30% annually
- Result: Constant pressure on pricing

## Key Metrics

| Metric | What It Tells You |
|--------|-------------------|
| **Bit shipments** | Volume demand |
| **ASP/Gb** | Pricing power |
| **Inventory (weeks)** | Supply/demand balance |
| **Capex/revenue** | Capacity discipline |
| **Technology mix** | Margin trajectory |

## Data Sources

- DRAMeXchange/TrendForce pricing
- Company earnings (Samsung semi division, SK Hynix, Micron)
- SemiAnalysis HBM model
