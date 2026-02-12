---
name: ai-compute-economics
description: AI compute cost modeling. Training vs inference economics, token-level costs, GPU utilization, fleet sizing, efficiency metrics.
---

# AI Compute Economics Context Pack

## When to Load

- Training cost estimation and cluster sizing
- Inference cost-per-token analysis
- GPU/accelerator fleet economics
- Cloud vs on-prem TCO comparison
- Model efficiency and optimization impact on costs

## Training Economics

### Cost Components

| Component | Share of TCO | Key Driver |
|-----------|-------------|------------|
| **GPU/accelerator** | 40-60% | Chip price, depreciation schedule |
| **Power** | 10-20% | Watts per GPU, local electricity rate |
| **Networking** | 10-15% | Cluster size, IB vs Ethernet |
| **Memory (HBM)** | Embedded in GPU | Capacity determines model fit |
| **Engineering** | 10-20% | Team size, iteration cycles |
| **Cooling** | 5-10% | PUE, liquid vs air |

### Training Cost Estimation

```
Training cost ($) = (GPU-hours) x ($/GPU-hour)

GPU-hours = (Total FLOP) / (GPU FLOPS x MFU x 3600)

Total FLOP ≈ 6 x Parameters x Tokens  (Chinchilla approximation)
```

### Training Cost Benchmarks

| Model | Parameters | Tokens | Estimated GPU-hours | Estimated Cost |
|-------|-----------|--------|---------------------|----------------|
| GPT-3 | 175B | 300B | ~3,500 A100-hours | ~$5M |
| Llama 2 70B | 70B | 2T | ~1.7M A100-hours | ~$3M |
| Llama 3 405B | 405B | 15T | ~30M H100-hours | ~$100M+ |
| GPT-4 (estimated) | ~1.8T MoE | ~13T | Unknown | ~$100M+ |
| Frontier models (2025) | 1T+ | 15T+ | ~50-100M H100-eq hours | $200M-$1B+ |

### Model FLOPS Utilization (MFU)

MFU = achieved FLOPS / peak hardware FLOPS. The single most important efficiency metric for training.

| Setup | Typical MFU | Notes |
|-------|------------|-------|
| Single GPU | 50-65% | Memory-bound operations lower effective MFU |
| 8-GPU node | 45-55% | NVLink communication overhead |
| 256 GPUs | 35-50% | Network becomes significant |
| 10K+ GPUs | 25-40% | Network overhead, failure recovery dominate |

MFU improvements compound: going from 30% to 40% MFU reduces training cost by 25%.

## Inference Economics

### Cost Structure

Inference cost splits into two phases per request:

| Phase | Compute Pattern | Bottleneck | GPU Utilization |
|-------|----------------|-----------|-----------------|
| **Prefill** | Compute-bound (process all input tokens) | FLOPS | High |
| **Decode** | Memory-bound (generate one token at a time) | Memory bandwidth | Low |

### Cost Per Token

```
Cost per token = (GPU-second per token) x ($/GPU-second)

GPU-second per token depends on:
  - Model size (parameters)
  - Batch size (higher = more efficient)
  - Quantization level (FP16 → INT8 → FP4)
  - KV cache size (grows with context length)
```

### Inference Pricing Benchmarks (API, 2025)

| Model Class | Input ($/M tokens) | Output ($/M tokens) | Notes |
|-------------|--------------------|--------------------|-------|
| Small (8-30B) | $0.05-0.30 | $0.10-0.60 | Llama 3.1 8B, Mixtral 8x7B |
| Medium (70-100B) | $0.30-1.00 | $0.60-2.00 | Llama 3.1 70B |
| Large (400B+) | $1.00-5.00 | $2.00-15.00 | Llama 3.1 405B, Claude, GPT-4 |
| Frontier | $5.00-15.00 | $15.00-75.00 | GPT-4 Turbo, Claude Opus |

API pricing includes margin (typically 50-80% gross margin for inference providers). Raw compute cost is 30-50% of API price.

### Batch Size Economics

| Batch Size | GPU Utilization | Latency | Cost Efficiency |
|------------|----------------|---------|-----------------|
| 1 | 5-15% | Lowest | Worst |
| 8 | 20-40% | Low | Moderate |
| 32 | 40-60% | Medium | Good |
| 128+ | 60-80% | Higher | Best |

Continuous batching (vLLM, TensorRT-LLM) dynamically groups requests to maintain high utilization without per-request latency spikes.

## Optimization Techniques

### Quantization Impact

| Precision | Memory Reduction | Speedup | Quality Loss |
|-----------|-----------------|---------|-------------|
| **FP32 → FP16/BF16** | 2x | 2x | None |
| **FP16 → INT8 (W8A8)** | 2x | 1.5-2x | Minimal |
| **FP16 → FP8** | 2x | 1.5-2x | Minimal |
| **FP16 → INT4 (W4A16)** | 4x | 2-3x | Small for large models |
| **FP16 → GPTQ/AWQ 4-bit** | 4x | 2-3x | Noticeable below 30B params |

### Architecture Optimizations

| Technique | Impact | Adoption |
|-----------|--------|----------|
| **MoE (Mixture of Experts)** | 2-4x fewer active params per token | Mixtral, GPT-4, DeepSeek V3 |
| **GQA (Grouped Query Attention)** | 4-8x KV cache reduction | Llama 2+, Mistral |
| **Speculative decoding** | 2-3x decode speedup | Growing adoption |
| **KV cache compression** | Longer context at lower cost | Research, early production |
| **Flash Attention** | 2-4x attention speedup, no quality loss | Universal |
| **Tensor parallelism** | Split model across GPUs within node | Standard for large models |
| **Pipeline parallelism** | Split model layers across nodes | Large training clusters |
| **Expert parallelism** | Distribute MoE experts across GPUs | DeepSeek, Mixtral |

## Fleet Economics

### GPU TCO Model

| Cost Item | On-Prem (3-year) | Cloud (on-demand) | Cloud (reserved 1yr) |
|-----------|------------------|-------------------|---------------------|
| **H100 SXM** | ~$30K purchase | ~$3.50/hr ($30K/yr) | ~$2.50/hr ($22K/yr) |
| **Power (700W, $0.06/kWh)** | ~$1.1K/yr | Included | Included |
| **Networking** | ~$3-5K/GPU | Included | Included |
| **Facility** | ~$1-2K/yr | Included | Included |
| **3-year TCO** | ~$40-45K | ~$90K | ~$65K |

On-prem is ~50% cheaper at 3-year horizon if utilization stays above 70%. Cloud wins at <50% utilization or unpredictable demand.

### Utilization Economics

| GPU Utilization | Effective $/GPU-hr (on-prem) | Waste |
|-----------------|------------------------------|-------|
| 90%+ | Optimal | Minimal |
| 70-90% | Acceptable | 10-30% overhead |
| 50-70% | Poor | Need better scheduling |
| <50% | Unacceptable | Cloud may be cheaper |

### Cloud Provider GPU Pricing

| Provider | GPU | On-Demand | Reserved (1yr) | Spot |
|----------|-----|-----------|-----------------|------|
| **AWS** | H100 (p5.48xlarge, 8x) | ~$98/hr | ~$65/hr | ~$30-40/hr |
| **GCP** | H100 (a3-highgpu-8g) | ~$98/hr | ~$70/hr | ~$30-35/hr |
| **Azure** | H100 (ND H100 v5, 8x) | ~$96/hr | ~$65/hr | ~$30-40/hr |
| **CoreWeave** | H100 SXM | ~$2.50/hr/GPU | ~$2.00/hr (committed) | N/A |
| **Lambda** | H100 SXM | ~$2.50/hr/GPU | ~$1.90/hr (reserved) | N/A |
| **Together AI** | H100 (API) | Varies by model | N/A | N/A |

Prices per 8-GPU instance for hyperscalers, per-GPU for GPU clouds. Spot pricing is volatile.

## Key Metrics

| Metric | What It Tells You |
|--------|-------------------|
| **MFU** | Training efficiency — higher means less waste |
| **Tokens/sec/GPU** | Inference throughput per accelerator |
| **Tokens/sec/watt** | Energy efficiency of inference |
| **$/M tokens** | Unit economics of inference |
| **GPU utilization %** | Fleet efficiency — idle GPUs are wasted capex |
| **Time to first token (TTFT)** | Prefill latency — user experience metric |
| **Inter-token latency (ITL)** | Decode speed — streaming experience quality |
| **TCO/GPU (3yr)** | Total cost of ownership per accelerator |
| **Training FLOP/$ (effective)** | Cost efficiency of training compute |

## Data Sources

- MLPerf Training and Inference benchmarks — standardized performance comparisons
- NVIDIA GTC presentations — architecture details, benchmark claims
- Cloud provider pricing pages — current GPU pricing
- Artificial Analysis — independent inference speed and cost benchmarks
- SemiAnalysis GPU economics model
- Epoch AI — training compute estimates for published models
- Company earnings calls — capex, GPU orders, utilization commentary
