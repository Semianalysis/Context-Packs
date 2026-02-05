---
name: semiconductors
description: Broad semiconductor industry context. Supply chain, process technology, business models.
---

# Semiconductors Context Pack

## When to Load

- Broad industry analysis
- Supply chain coverage
- Cross-segment comparisons
- Industry primers

## Industry Structure

```
Design (Fabless) → Manufacturing (Foundry) → Packaging (OSAT) → End Market
     ↓                    ↓                       ↓
   EDA Tools         Equipment              Test Equipment
```

### Business Models

| Model | Description | Examples |
|-------|-------------|----------|
| **Fabless** | Design only, outsource manufacturing | NVIDIA, AMD, Qualcomm, Broadcom |
| **IDM** | Design + manufacturing | Intel, Samsung, TI, Infineon |
| **Foundry** | Manufacturing for others | TSMC, GlobalFoundries, UMC |
| **OSAT** | Packaging and test | ASE, Amkor, JCET |

## Supply Chain

### Geographic Concentration

| Segment | Dominant Region | Share |
|---------|-----------------|-------|
| Leading-edge foundry | Taiwan | ~90% |
| Memory | Korea | ~70% |
| OSAT | China/Taiwan | ~80% |
| EUV lithography | Netherlands | 100% |
| Design | US | ~50% |

### Critical Chokepoints

1. **TSMC** — Only source for leading-edge logic (<7nm)
2. **ASML** — Only source for EUV lithography
3. **HBM** — SK Hynix + Samsung control ~95%
4. **Advanced packaging** — TSMC CoWoS capacity constrained

## Process Technology

### Node Naming (Marketing vs Reality)

| Marketing Node | Actual Gate Pitch | Transistor Density |
|----------------|-------------------|-------------------|
| 7nm | ~54nm | ~90M/mm² |
| 5nm | ~48nm | ~170M/mm² |
| 3nm | ~45nm | ~290M/mm² |
| 2nm (GAA) | ~42nm | ~400M/mm² |

### Architecture Transitions

| Era | Architecture | Nodes |
|-----|--------------|-------|
| Planar | 2D transistor | 90nm → 28nm |
| FinFET | 3D fin | 22nm → 3nm |
| GAA | Nanosheet/forksheet | 2nm → beyond |

## Key Metrics

| Metric | What It Tells You |
|--------|-------------------|
| **Wafer starts** | Capacity utilization |
| **ASP** | Mix shift, pricing power |
| **Yield** | Manufacturing maturity |
| **Lead time** | Supply/demand balance |
| **Book-to-bill** | Forward demand indicator |
| **Inventory days** | Channel health |

## Data Sources

- Company earnings calls and 10-Ks
- SEMI equipment data
- TrendForce, Counterpoint (paid)
- SemiAnalysis internal models
