# Context Packs

Domain-specific knowledge packs for Claude Code. Load relevant packs based on your session topic.

## Usage

### In semianalysis-claude

Context packs are loaded automatically based on your session goal. The `shared` pack loads every session; domain packs load as needed.

### Standalone

```bash
# Clone to your project
git clone https://github.com/Semianalysis/Context-Packs.git context-packs

# Reference in your CLAUDE.md
# "Load context from context-packs/shared/ and context-packs/memory/"
```

## Available Packs

| Pack | Description | Load When |
|------|-------------|-----------|
| `shared` | Style guide, terminology, data sources | Always |
| `semiconductors` | Industry overview, supply chain, process nodes | Broad semi coverage |
| `memory` | DRAM, NAND, HBM deep dive | Memory-specific analysis |
| `ai-accelerators` | GPUs, TPUs, custom silicon | AI hardware coverage |
| `foundry` | TSMC, Samsung, Intel, packaging | Manufacturing analysis |
| `datacenter` | Infrastructure, hyperscalers, power | DC buildout coverage |
| `equipment` | ASML, Applied, Lam, KLA | Equipment/litho analysis |
| `geopolitics` | Export controls, CHIPS Act, China | Policy/trade analysis |
| `networking` | NVLink, InfiniBand, CPO, interconnects | AI cluster networking |
| `hyperscalers` | Google, Microsoft, Amazon, Meta strategies | Cloud/custom silicon |
| `finance` | Financial statements, valuation, metrics | Company analysis |

## Pack Structure

Each pack contains:

```
{pack}/
├── CONTEXT.md      # Overview, when to load, key concepts
├── players.md      # Key companies, relationships (optional)
├── terminology.md  # Domain-specific terms (optional)
└── sources.md      # Where to find data (optional)
```

## Contributing

1. Create a branch
2. Add/update pack content
3. PR with description of changes

Keep packs focused — better to have multiple small packs than one bloated pack.
