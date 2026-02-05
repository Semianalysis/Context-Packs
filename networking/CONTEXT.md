---
name: networking
description: AI/datacenter networking. NVLink, InfiniBand, Ethernet, co-packaged optics, interconnect economics.
---

# Networking Context Pack

## When to Load

- AI cluster networking analysis
- Interconnect technology comparisons
- Optical vs electrical tradeoffs
- Network equipment vendors

## Why Networking Matters for AI

**Memory bandwidth wall**: GPUs are faster than memory can feed them.
**Network bandwidth wall**: Clusters are faster than networks can connect them.

At scale, networking determines:
- Maximum cluster size
- Training efficiency (communication overhead)
- TCO (networking can be 20-30% of cluster cost)

## Interconnect Hierarchy

```
Intra-chip → Intra-node → Intra-rack → Intra-cluster → Inter-cluster
   ↓            ↓            ↓             ↓              ↓
  HBM      NVLink/PCIe   NVLink/IB    IB/Ethernet    WAN/Ethernet
```

### Bandwidth at Each Level

| Level | Technology | Bandwidth | Latency |
|-------|------------|-----------|---------|
| GPU↔HBM | HBM3E | 4.8 TB/s | ~ns |
| GPU↔GPU (node) | NVLink 5 | 900 GB/s | ~μs |
| Node↔Node (rack) | InfiniBand NDR | 400 Gb/s | ~μs |
| Rack↔Rack | IB/Ethernet | 400-800 Gb/s | ~10μs |

## NVIDIA Networking Stack

### NVLink Evolution

| Gen | Bandwidth (per GPU) | GPUs Connected | Products |
|-----|---------------------|----------------|----------|
| NVLink 3 | 600 GB/s | 8 (DGX A100) | A100 |
| NVLink 4 | 900 GB/s | 8 (DGX H100) | H100 |
| NVLink 5 | 1.8 TB/s | 576 (NVL72) | B200, GB200 |

### NVSwitch

- Custom ASIC connecting NVLink domains
- NVL72: 72 GPUs fully connected via NVSwitch
- Enables "GPU fabric" — all GPUs see unified memory

### NVIDIA Networking Products

| Product | Type | Speed | Use Case |
|---------|------|-------|----------|
| ConnectX-7 | NIC | 400 Gb/s | IB/Ethernet |
| BlueField-3 | DPU | 400 Gb/s | SmartNIC + CPU |
| Quantum-2 | Switch | 400 Gb/s NDR | IB fabric |
| Spectrum-4 | Switch | 800 Gb/s | Ethernet fabric |

## InfiniBand vs Ethernet

| Factor | InfiniBand | Ethernet |
|--------|------------|----------|
| Latency | ~1μs | ~2-5μs |
| RDMA | Native | RoCE (overlay) |
| Congestion control | Credit-based | ECN/PFC |
| Ecosystem | NVIDIA dominated | Multi-vendor |
| Cost | Higher | Lower |
| Adoption | HPC, AI training | General DC |

### When to Use Which

- **InfiniBand**: Large training clusters, latency-sensitive, NVIDIA stack
- **Ethernet**: Inference, mixed workloads, cost-sensitive, multi-vendor

## Co-Packaged Optics (CPO)

### The Problem

Electrical interconnects hitting limits:
- Power consumption scaling poorly
- Signal integrity at 800G+
- Reach limitations

### CPO Solution

Integrate optics directly into switch/GPU package:
- Lower power (no electrical-optical conversion at edge)
- Higher bandwidth density
- Shorter reach electrical, longer reach optical

### CPO Timeline

| Phase | Status | Players |
|-------|--------|---------|
| Pluggable optics | Current | Coherent, II-VI, Lumentum |
| Near-package optics | Ramping | Broadcom, NVIDIA |
| Co-packaged optics | 2025+ | All major switch vendors |
| On-chip optics | R&D | Intel, startups |

## Key Vendors

### Switch Silicon

| Vendor | Product | Position |
|--------|---------|----------|
| Broadcom | Memory | #1 merchant silicon |
| NVIDIA | Spectrum | Vertical integration |
| Intel | Tofino | Programmable (divesting?) |
| Marvell | Prestera | Growing share |

### Optical Components

| Vendor | Specialty |
|--------|-----------|
| Coherent (II-VI) | Transceivers, lasers |
| Lumentum | Lasers, ROADMs |
| Broadcom | Silicon photonics |
| Intel | Silicon photonics |

### Cable/Interconnect

| Vendor | Product |
|--------|---------|
| Amphenol | Cables, connectors |
| TE Connectivity | High-speed cables |
| Molex | Connectors |

## Network Topologies

### Fat Tree (Clos)

Standard datacenter topology:
- Leaf switches connect to servers
- Spine switches connect leaves
- Non-blocking at full subscription

### Dragonfly

Used in large HPC/AI clusters:
- Groups of switches locally connected
- Groups connected via global links
- Lower cable count than fat tree

### Rail-Optimized

For GPU clusters:
- Each "rail" is a separate network plane
- GPUs connect to corresponding rail switch
- Reduces NVLink traffic on fabric

## AI Training Network Requirements

### Collective Operations

| Operation | Description | Network Impact |
|-----------|-------------|----------------|
| AllReduce | Aggregate gradients | O(n) traffic |
| AllGather | Collect activations | High bandwidth |
| AllToAll | Attention sharding | Latency sensitive |

### Scaling Laws

| Cluster Size | Network Overhead | Efficiency |
|--------------|------------------|------------|
| 8 GPUs | ~5% | ~95% |
| 64 GPUs | ~10% | ~90% |
| 1K GPUs | ~15-20% | ~80-85% |
| 10K GPUs | ~25-30% | ~70-75% |

## Key Metrics

| Metric | What It Tells You |
|--------|-------------------|
| **Bisection bandwidth** | Worst-case throughput |
| **Oversubscription** | Contention risk |
| **Tail latency (p99)** | Consistency |
| **RDMA efficiency** | Protocol overhead |
| **$/Gb/s** | Cost efficiency |

## Data Sources

- NVIDIA GTC networking presentations
- OCP Summit talks
- Ethernet Alliance roadmaps
- SemiAnalysis AI Networking Model
