# AI Compute Economics Players

## Cloud GPU Providers

| Provider | GPU Fleet | Pricing Model | Differentiator |
|----------|-----------|---------------|---------------|
| **AWS** | H100, Trainium, Inferentia | On-demand, reserved, spot | Largest cloud, custom chips (Trainium2) |
| **Google Cloud** | H100, A3, TPU v5p/v6 | On-demand, committed use | TPU advantage for large training, Gemini infra |
| **Azure** | H100, Maia 100 | On-demand, reserved, spot | OpenAI partnership, enterprise integration |
| **CoreWeave** | H100, GB200 | Reserved, committed | GPU-native cloud, NVIDIA partnership, bare metal |
| **Lambda Labs** | H100, A100 | On-demand, reserved | Developer-friendly, research focus |
| **Together AI** | H100 fleet | API (per-token) | Open model inference, serverless |
| **Fireworks AI** | H100 fleet | API (per-token) | Fast inference, FireAttention optimization |
| **Groq** | LPU (custom ASIC) | API (per-token) | Deterministic latency, high throughput |
| **Cerebras** | WSE-3 (wafer-scale) | API, dedicated | Single-chip model fitting, no parallelism overhead |
| **SambaNova** | SN40L (custom) | API, enterprise | Reconfigurable dataflow architecture |

## Chip Vendors

| Vendor | Training Product | Inference Product | Competitive Position |
|--------|-----------------|-------------------|---------------------|
| **NVIDIA** | H100, B100, B200, GB200 | H100, L40S, GB200 | Dominant — CUDA ecosystem, NVLink, full stack |
| **AMD** | MI300X, MI350 | MI300X | Price-competitive, ROCm maturing, gaining share |
| **Intel** | Gaudi 3 | Gaudi 3 | Struggling for traction, price-aggressive |
| **Google** | TPU v5p, Trillium (v6) | TPU v5e | Internal + Cloud, JAX ecosystem |
| **Amazon** | Trainium2 | Inferentia2 | Internal + AWS, Neuron SDK |
| **Microsoft** | Maia 100 | Maia 100 | Azure-exclusive, co-design with Cobalt CPU |
| **Broadcom** | Custom ASIC (for Google, Meta) | Custom ASIC | Leading AI ASIC design partner |
| **Marvell** | Custom ASIC (for Amazon, MSFT) | Custom ASIC | Growing AI ASIC practice |

## Inference Optimization Stack

| Company | Product | Technique |
|---------|---------|-----------|
| **vLLM (UC Berkeley)** | vLLM engine | PagedAttention, continuous batching |
| **NVIDIA** | TensorRT-LLM | Graph optimization, quantization, in-flight batching |
| **Hugging Face** | TGI (Text Generation Inference) | Tensor parallelism, continuous batching |
| **Neural Magic** | nm-vllm, SparseML | Sparsity, quantization |
| **MLC AI** | MLC-LLM | Universal deployment, WebGPU/Metal |
| **Exo Labs** | Exo | Distributed inference across heterogeneous devices |

## Model Efficiency Research

| Organization | Contribution |
|-------------|-------------|
| **DeepSeek** | MoE efficiency (V2/V3), multi-head latent attention |
| **Mistral** | Efficient MoE (Mixtral), grouped query attention |
| **Meta (FAIR)** | Llama series, GQA, open weight efficiency baselines |
| **Google DeepMind** | Chinchilla scaling laws, Gemini architecture efficiency |
| **Anthropic** | Constitutional AI efficiency, long-context optimization |
| **Tri Dao (Princeton)** | Flash Attention — universally adopted memory-efficient attention |
