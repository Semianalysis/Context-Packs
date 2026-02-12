# AI Compute Economics Terminology

## Compute Metrics

| Term | Definition |
|------|------------|
| **FLOPS** | Floating-point operations per second — raw compute throughput |
| **TFLOPS** | Tera (10^12) FLOPS |
| **PFLOPS** | Peta (10^15) FLOPS |
| **MFU** | Model FLOPS Utilization — achieved FLOPS / peak hardware FLOPS. The key training efficiency metric |
| **HFU** | Hardware FLOPS Utilization — similar to MFU but counts all FLOPS including recomputation |
| **Tokens/sec** | Inference throughput — output tokens generated per second |
| **Tokens/sec/watt** | Energy efficiency of inference — higher is better |
| **TTFT** | Time To First Token — latency from request to first generated token (prefill time) |
| **ITL** | Inter-Token Latency — time between consecutive generated tokens (decode speed) |
| **TPS** | Tokens Per Second — usually refers to per-user decode throughput |

## Training Concepts

| Term | Definition |
|------|------------|
| **Pre-training** | Initial training on large corpus — most expensive phase |
| **Fine-tuning** | Adapting a pre-trained model to specific tasks — 10-100x cheaper than pre-training |
| **RLHF** | Reinforcement Learning from Human Feedback — alignment training phase |
| **Scaling laws** | Empirical relationships between compute, data, params, and loss (Kaplan, Chinchilla) |
| **Chinchilla-optimal** | Training a model on ~20 tokens per parameter — compute-optimal ratio |
| **Over-training** | Training on more tokens than Chinchilla-optimal — produces smaller, cheaper-to-serve models |
| **Epoch** | One complete pass through the training dataset |
| **Gradient accumulation** | Simulating larger batch sizes across multiple forward passes |
| **Checkpoint** | Saved model state for restart/recovery — critical for multi-day training runs |

## Inference Concepts

| Term | Definition |
|------|------------|
| **Prefill** | Processing all input tokens in parallel — compute-bound phase |
| **Decode** | Generating output tokens one at a time — memory-bandwidth-bound phase |
| **KV cache** | Stored key-value attention states from previous tokens — grows linearly with context |
| **Continuous batching** | Dynamically grouping requests to maximize GPU utilization |
| **PagedAttention** | Memory management for KV cache using virtual memory concepts (vLLM) |
| **Speculative decoding** | Small model drafts tokens, large model verifies in parallel — 2-3x speedup |
| **Prompt caching** | Reusing KV cache for repeated prompt prefixes — reduces prefill cost |
| **Disaggregated serving** | Separate prefill and decode on different hardware optimized for each |

## Quantization

| Term | Definition |
|------|------------|
| **FP32** | 32-bit floating point — full precision, 4 bytes per parameter |
| **FP16 / BF16** | 16-bit floating point / Brain Float 16 — standard training precision, 2 bytes |
| **FP8 (E4M3/E5M2)** | 8-bit floating point — emerging training/inference precision |
| **INT8 (W8A8)** | 8-bit integer weights and activations — common inference quantization |
| **INT4 (W4A16)** | 4-bit weights, 16-bit activations — aggressive weight compression |
| **GPTQ** | Post-training quantization method using approximate second-order information |
| **AWQ** | Activation-aware Weight Quantization — preserves salient weight channels |
| **GGUF** | File format for quantized models, used by llama.cpp — supports mixed quantization |
| **Perplexity degradation** | Quality loss measured by increased perplexity after quantization |

## Parallelism

| Term | Definition |
|------|------------|
| **Data parallelism (DP)** | Same model on multiple GPUs, different data — simplest scaling |
| **Tensor parallelism (TP)** | Split individual layers across GPUs within a node — requires fast NVLink |
| **Pipeline parallelism (PP)** | Split model layers across nodes — tolerates network latency |
| **Expert parallelism (EP)** | Distribute MoE experts across GPUs — natural for MoE architectures |
| **FSDP** | Fully Sharded Data Parallelism — shards optimizer state + gradients + parameters |
| **ZeRO** | Zero Redundancy Optimizer (DeepSpeed) — progressive sharding stages (1/2/3) |
| **Context parallelism** | Split long sequences across GPUs — for very long context training |
| **Sequence parallelism** | Split LayerNorm/dropout activations across the sequence dimension |

## Economics

| Term | Definition |
|------|------------|
| **TCO** | Total Cost of Ownership — hardware + power + cooling + networking + ops over lifetime |
| **$/GPU-hour** | Unit cost of GPU compute time — standard comparison metric |
| **$/M tokens** | Unit cost per million tokens — standard inference pricing metric |
| **Gross margin** | (Revenue - compute cost) / Revenue — for inference API providers |
| **Utilization rate** | % of time GPUs are doing useful work — drives unit economics |
| **Amortization** | Spreading GPU purchase cost over useful life (typically 3-5 years) |
| **Spot pricing** | Discounted preemptible GPU instances — 50-70% off on-demand |
| **Reserved instances** | Committed-use pricing — 30-40% discount for 1-3 year commitments |
| **Inference cost curve** | Cost per token declining ~4x/year from hardware + software improvements |

## Architecture

| Term | Definition |
|------|------------|
| **MoE** | Mixture of Experts — only a subset of parameters active per token (e.g., 8 of 128 experts) |
| **GQA** | Grouped Query Attention — shares KV heads across query heads, reducing KV cache size |
| **MHA** | Multi-Head Attention — standard attention with independent KV heads per query head |
| **MLA** | Multi-head Latent Attention — compresses KV cache via low-rank projection (DeepSeek) |
| **SWA** | Sliding Window Attention — limits attention to fixed window, reduces compute for long context |
| **RoPE** | Rotary Position Embedding — standard positional encoding, supports length extrapolation |
