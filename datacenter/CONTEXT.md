---
name: datacenter
description: Hyperscaler infrastructure, power, cooling, buildout trends.
---

# Datacenter Context Pack

## When to Load

- Hyperscaler capex analysis
- Power and cooling infrastructure
- AI cluster buildouts
- Datacenter real estate/geography

## Hyperscaler Landscape

### Big 4 Cloud Capex (2024)

| Company | Capex | YoY | AI Focus |
|---------|-------|-----|----------|
| Microsoft | ~$50B | +50% | Azure AI, OpenAI |
| Google | ~$35B | +60% | TPU, Gemini |
| Amazon | ~$60B | +40% | AWS, Trainium |
| Meta | ~$40B | +30% | Training clusters |

### Non-Cloud AI Spenders

| Company | Focus |
|---------|-------|
| Oracle | OCI AI clusters |
| CoreWeave | GPU-as-a-service |
| Lambda Labs | AI cloud |
| xAI | Massive training clusters |

## Power Requirements

### Per-Rack Power Density

| Era | Power/Rack | Cooling |
|-----|------------|---------|
| Traditional | 5-10 kW | Air |
| GPU (V100) | 20-30 kW | Air/liquid assist |
| GPU (H100) | 40-60 kW | Direct liquid |
| GPU (B200) | 100+ kW | Full liquid |

### AI Cluster Power

| Cluster Size | Total Power | Equivalent |
|--------------|-------------|------------|
| 1K H100s | ~1 MW | Small town |
| 10K H100s | ~10 MW | Large factory |
| 100K H100s | ~100 MW | Small city |
| 1M GPUs | ~1 GW | Nuclear plant |

## Cooling Evolution

### Technology Progression

| Method | Efficiency | Density Support |
|--------|------------|-----------------|
| Air cooling | Low | <20 kW/rack |
| Rear-door heat exchangers | Medium | 20-40 kW/rack |
| Direct-to-chip liquid | High | 40-100 kW/rack |
| Immersion | Highest | 100+ kW/rack |

### Liquid Cooling Players

- **Vertiv** — Traditional DC infrastructure
- **Coolit** — Direct-to-chip
- **GRC** — Immersion
- **Supermicro** — Integrated solutions

## Geographic Considerations

### Power Availability

| Region | Power Cost | Availability | Challenges |
|--------|------------|--------------|------------|
| Texas | Low | Good | Grid stability |
| Virginia | Medium | Constrained | Permitting |
| Iowa | Low | Good | Limited labor |
| Nordic | Low (hydro) | Good | Latency to users |
| Singapore | High | Limited | Land, power |

### Emerging AI Hubs

- **Middle East**: UAE, Saudi (cheap power, capital)
- **Malaysia**: Johor (Singapore overflow)
- **Japan**: Government incentives

## Supply Chain Constraints

| Component | Constraint | Lead Time |
|-----------|------------|-----------|
| GPUs | TSMC CoWoS, HBM | 6-12 months |
| Transformers | Copper, manufacturing | 12-18 months |
| Switchgear | Custom builds | 12-24 months |
| Generators | Demand surge | 6-12 months |

## Key Metrics

| Metric | What It Tells You |
|--------|-------------------|
| **PUE** | Power efficiency (1.0 = perfect) |
| **$/MW** | Build cost |
| **Utilization** | Demand vs capacity |
| **Interconnect** | Networking capability |

## Data Sources

- Hyperscaler earnings calls
- Utility filings
- Real estate/construction data
- SemiAnalysis datacenter model
