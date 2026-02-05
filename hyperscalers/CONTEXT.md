---
name: hyperscalers
description: Google, Microsoft, Amazon, Meta AI strategies. Custom silicon, capex, cloud positioning.
---

# Hyperscalers Context Pack

## When to Load

- Cloud provider analysis
- Custom silicon programs
- AI infrastructure capex
- Cloud GPU/AI service comparisons

## The Big 4 + Key Players

| Company | Cloud | AI Focus | Custom Silicon |
|---------|-------|----------|----------------|
| Microsoft | Azure | OpenAI, Copilot | Maia, Cobalt |
| Google | GCP | Gemini, Vertex | TPU |
| Amazon | AWS | Bedrock, Alexa | Trainium, Inferentia, Graviton |
| Meta | — | Llama, internal | MTIA |
| Oracle | OCI | GPU cloud | — |
| CoreWeave | — | GPU-as-a-service | — |

## Microsoft

### AI Strategy

- **OpenAI partnership**: $13B+ invested, exclusive cloud provider
- **Copilot**: AI across Office, GitHub, Windows
- **Azure AI**: OpenAI API resale + Azure ML

### Infrastructure

| Component | Approach |
|-----------|----------|
| Training | NVIDIA GPUs (massive H100 deployments) |
| Inference | NVIDIA + Maia (custom) |
| CPU | AMD EPYC + Cobalt (Arm) |

### Custom Silicon

| Chip | Type | Status |
|------|------|--------|
| Maia 100 | AI accelerator | Production 2024 |
| Cobalt | Arm CPU | Production 2024 |

### Capex

- FY24: ~$50B (up from ~$32B FY23)
- Fastest growth among hyperscalers
- Building datacenters globally

## Google

### AI Strategy

- **Gemini**: Frontier model family
- **Vertex AI**: MLOps platform
- **Search/Ads**: Core business AI integration
- **Waymo, DeepMind**: Research arms

### Infrastructure

| Component | Approach |
|-----------|----------|
| Training | TPU (primary) + NVIDIA |
| Inference | TPU + NVIDIA |
| CPU | Intel/AMD + custom Arm |

### TPU Generations

| Gen | Process | HBM | Status |
|-----|---------|-----|--------|
| TPU v4 | 7nm | HBM2E | Mature |
| TPU v5e | 7nm | HBM2E | Volume (inference) |
| TPU v5p | 7nm | HBM2E | Volume (training) |
| TPU v6 (Trillium) | 5nm | HBM3 | 2024 |
| TPU v7 | 3nm? | HBM3E | 2025 |

### Differentiation

- **Largest TPU pods**: 8,960 chips in single cluster
- **Vertical integration**: Silicon + software + models
- **Multi-cloud reluctance**: Prefer GCP-native

## Amazon (AWS)

### AI Strategy

- **Bedrock**: Model-agnostic AI platform
- **SageMaker**: MLOps
- **Partnerships**: Anthropic ($4B), AI21, Cohere
- **Alexa/devices**: On-device AI

### Infrastructure

| Component | Approach |
|-----------|----------|
| Training | Trainium (custom) + NVIDIA |
| Inference | Inferentia + NVIDIA |
| CPU | Graviton (Arm) |

### Custom Silicon

| Chip | Gen | Process | Use |
|------|-----|---------|-----|
| Graviton 3 | 3rd | 5nm | General compute |
| Graviton 4 | 4th | 3nm | General compute |
| Trainium | 1st | 7nm | Training |
| Trainium 2 | 2nd | 3nm | Training (2024) |
| Inferentia 2 | 2nd | 5nm | Inference |

### Differentiation

- **Broadest cloud services**: 200+ services
- **Custom silicon maturity**: Years ahead on Arm CPUs
- **Enterprise relationships**: Deepest penetration

## Meta

### AI Strategy

- **Llama**: Open-weight models
- **Internal AI**: Feed ranking, ads, content moderation
- **Metaverse/AR**: Long-term AI applications
- **No cloud business**: All internal consumption

### Infrastructure

| Component | Approach |
|-----------|----------|
| Training | NVIDIA GPUs (massive scale) |
| Inference | NVIDIA + MTIA |
| Research | Open Compute Project |

### Custom Silicon

| Chip | Type | Status |
|------|------|--------|
| MTIA v1 | Inference | Limited deployment |
| MTIA v2 | Inference | Ramping 2024 |

### Scale

- One of largest GPU buyers globally
- Building 2GW+ of AI capacity
- Open-sourcing models drives ecosystem

## Oracle

### AI Strategy

- **OCI GPU Cloud**: Bare-metal GPU instances
- **NVIDIA partnership**: SuperCluster deployments
- **Enterprise AI**: Database, ERP integration

### Differentiation

- Bare-metal performance (no virtualization overhead)
- Aggressive GPU pricing
- Strong with NVIDIA enterprise deals

## Capex Comparison (2024)

| Company | Capex | YoY | AI % (est) |
|---------|-------|-----|------------|
| Amazon | ~$60B | +40% | 50%+ |
| Microsoft | ~$50B | +50% | 60%+ |
| Meta | ~$40B | +30% | 70%+ |
| Google | ~$35B | +60% | 50%+ |

## Build vs Buy Tradeoffs

### Why Build Custom Silicon

| Reason | Impact |
|--------|--------|
| Cost | Avoid NVIDIA 60-70% margins |
| Optimization | Tailor to specific workloads |
| Supply | Reduce single-vendor dependency |
| Differentiation | Unique cloud offerings |

### Why Buy NVIDIA

| Reason | Impact |
|--------|--------|
| Ecosystem | CUDA, libraries, developer familiarity |
| Time-to-market | Available now |
| Performance | Leading-edge capabilities |
| Flexibility | Run any workload |

## Competitive Dynamics

### GPU Cloud Pricing (H100)

| Provider | $/GPU-hr (on-demand) | Notes |
|----------|---------------------|-------|
| AWS | $3.50-4.00 | p5 instances |
| Azure | $3.50-4.00 | ND H100 |
| GCP | $3.50-4.00 | A3 instances |
| CoreWeave | $2.50-3.00 | GPU-focused |
| Lambda | $2.00-2.50 | Startup |

### AI Service Positioning

| Provider | Strength |
|----------|----------|
| Azure | OpenAI exclusivity |
| AWS | Enterprise breadth |
| GCP | TPU differentiation |
| Oracle | Bare-metal performance |

## Key Metrics

| Metric | What It Tells You |
|--------|-------------------|
| **AI capex %** | Commitment level |
| **Custom silicon %** | Vertical integration |
| **GPU availability** | Capacity position |
| **$/FLOP** | Cost efficiency |

## Data Sources

- Quarterly earnings calls (all)
- Cloud pricing pages
- GTC, re:Invent, Next announcements
- SemiAnalysis datacenter model
