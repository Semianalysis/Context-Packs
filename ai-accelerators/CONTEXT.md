---
name: ai-accelerators
description: GPU, TPU, and custom AI silicon. NVIDIA ecosystem, competitors, hyperscaler chips.
---

# AI Accelerators Context Pack

## When to Load

- NVIDIA analysis
- AI chip competition
- Hyperscaler custom silicon
- Training vs inference hardware

## Market Landscape

### Training Market (2024)

| Vendor | Product | Share | Notes |
|--------|---------|-------|-------|
| NVIDIA | H100/H200 | ~90% | Dominant, ecosystem lock-in |
| AMD | MI300X | ~5% | Growing with ROCm improvements |
| Google | TPU v5p | ~3% | Internal + Cloud |
| Others | Various | ~2% | Intel, startups |

### Inference Market

More fragmented than training:
- NVIDIA (GPUs)
- Cloud custom (AWS Inferentia, Google TPU)
- Edge (Qualcomm, Apple, MediaTek NPUs)
- Startups (Groq, Cerebras, SambaNova)

## NVIDIA Stack

### Current Products

| Product | Process | HBM | TDP | Use Case |
|---------|---------|-----|-----|----------|
| H100 SXM | TSMC 4N | 80GB HBM3 | 700W | Training standard |
| H200 | TSMC 4N | 141GB HBM3E | 700W | Large models |
| B100 | TSMC 4NP | 192GB HBM3E | 700W | Next-gen training |
| B200 | TSMC 4NP | 192GB HBM3E | 1000W | Flagship |
| GB200 | TSMC 4NP | 384GB (2x) | 2700W | Grace+Blackwell |

### NVIDIA Moat

1. **CUDA ecosystem** — 20+ years of software, libraries, frameworks
2. **NVLink/NVSwitch** — Proprietary high-bandwidth interconnect
3. **Full stack** — Hardware + networking + software + services
4. **Developer mindshare** — Default choice, extensive documentation

## AMD Competition

### MI300 Series

| Product | Config | HBM | Target |
|---------|--------|-----|--------|
| MI300X | GPU only | 192GB HBM3 | Training/inference |
| MI300A | GPU + CPU | 128GB HBM3 | HPC |

### AMD Challenges

- ROCm maturity vs CUDA
- Software ecosystem gap
- Customer inertia
- Different different different memory config

## Hyperscaler Custom Silicon

| Company | Chip | Process | Use Case |
|---------|------|---------|----------|
| Google | TPU v5p | TSMC 4nm | Training + inference |
| Amazon | Trainium2 | TSMC 3nm | Training |
| Amazon | Inferentia2 | TSMC 5nm | Inference |
| Microsoft | Maia 100 | TSMC 5nm | Inference |
| Meta | MTIA v2 | TSMC 5nm | Inference |

### Why Build Custom?

1. **Cost** — Avoid NVIDIA margins (60-70% gross)
2. **Optimization** — Tailor to specific workloads
3. **Supply** — Reduce NVIDIA dependency
4. **Differentiation** — Unique cloud offerings

## Key Metrics

| Metric | What It Tells You |
|--------|-------------------|
| **FLOPS** | Raw compute (FP8/FP16/FP32) |
| **Memory bandwidth** | Data movement speed |
| **TDP** | Power/cooling requirements |
| **Perf/watt** | Efficiency |
| **TCO** | Real cost to deploy |

## Data Sources

- NVIDIA earnings and GTC announcements
- MLPerf benchmarks
- Hyperscaler earnings calls
- SemiAnalysis accelerator model
