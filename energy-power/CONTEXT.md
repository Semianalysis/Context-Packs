---
name: energy-power
description: Datacenter power infrastructure. Grid interconnection, onsite generation, PPAs, cooling, PUE, regulatory landscape.
---

# Energy & Power Infrastructure Context Pack

## When to Load

- Datacenter power sourcing and delivery analysis
- Grid interconnection queue and constraint tracking
- Power Purchase Agreements and renewable procurement
- PUE, cooling architecture, and efficiency benchmarking
- Utility regulatory filings and rate structures

## Power Delivery Chain

```
Generation → Transmission (HV) → Substation → Distribution → Datacenter
   ↓              ↓                  ↓             ↓              ↓
 Utility/     345-765kV         Step-down      13.8-34.5kV    Medium voltage
 Onsite/BYOG  lines             to MV          feeders        switchgear → UPS → PDU → rack
```

### Sourcing Models

| Model | Description | Lead Time | Scale |
|-------|-------------|-----------|-------|
| **Utility feed** | Standard grid connection via local utility | 2-5 years | 10-500 MW |
| **Behind-the-meter generation** | Onsite gas turbines or fuel cells | 12-18 months | 10-100 MW |
| **BYOG (Bring Your Own Generation)** | Dedicated generation asset, may bypass utility | 18-36 months | 50-500 MW |
| **PPA (offsite)** | Contract with remote renewable project, financial settlement | 1-3 years | 10-1000 MW |
| **Direct wire** | Physical connection to adjacent generation | 12-24 months | 50-200 MW |
| **Nuclear (SMR)** | Small modular reactors, emerging | 5-10 years | 50-300 MW |

### Grid Interconnection

The interconnection queue is the primary bottleneck for new datacenter capacity in the US.

| ISO/RTO | Queue Backlog | Avg Wait | Datacenter Hotspots |
|---------|---------------|----------|---------------------|
| **PJM** | ~300 GW | 4-5 years | Northern Virginia (Dominion) |
| **ERCOT** | ~350 GW | 2-3 years | Dallas-Fort Worth, San Antonio |
| **MISO** | ~250 GW | 3-4 years | Iowa, Illinois |
| **CAISO** | ~200 GW | 3-4 years | Santa Clara, Los Angeles |
| **SPP** | ~150 GW | 2-3 years | Oklahoma, Kansas |

**Key constraint**: Queue backlogs are dominated by speculative renewable+storage projects. Completion rates are historically 15-25%. Datacenter loads compete with generation projects for the same transmission studies.

## Onsite Generation

### Natural Gas

| Technology | Efficiency | Start Time | Use Case |
|------------|-----------|------------|----------|
| **Simple cycle gas turbine** | 30-40% | Minutes | Peaking, backup, BYOG |
| **Combined cycle** | 55-65% | Hours | Baseload BYOG |
| **Reciprocating engine** | 40-48% | Seconds | Distributed, flexible |
| **Fuel cell (SOFC/MCFC)** | 45-60% | N/A (continuous) | Baseload, clean |

### Emerging Baseload

| Technology | Status | Players |
|------------|--------|---------|
| **SMR nuclear** | Pre-licensing | NuScale, Oklo, Kairos, X-energy |
| **Geothermal (EGS)** | Pilot | Fervo Energy, Sage Geosystems |
| **Long-duration storage** | Demo/early commercial | Form Energy, ESS Inc |
| **Natural gas + CCS** | Pilot | NET Power (Allam cycle) |

## Renewable Procurement

### PPA Structures

| Type | Mechanism | Risk Profile |
|------|-----------|-------------|
| **Physical PPA** | Actual delivery of electrons to buyer's load zone | Basis risk if zones differ |
| **Virtual/Financial PPA** | Contract for differences vs market price | Merchant price exposure |
| **Bundled PPA** | Energy + RECs together | Cleanest accounting |
| **Sleeve PPA** | Utility intermediates between generator and buyer | Lower credit requirements |

### REC Accounting

| Type | Credibility | Use |
|------|-------------|-----|
| **Bundled RECs** | High | Delivered with physical energy |
| **Unbundled RECs** | Low-Medium | Purchased separately, no additionality guarantee |
| **24/7 matching** | Highest | Hourly matching of generation to consumption |

Google and Microsoft have committed to 24/7 carbon-free energy (CFE) matching. This is substantially harder than annual REC matching and drives demand for firm clean power (geothermal, nuclear, storage).

## Power Density & Cooling

### Rack Power Trends

| Era | Power/Rack | Cooling Approach |
|-----|------------|-----------------|
| Traditional IT | 5-10 kW | Air (CRAC/CRAH) |
| GPU (V100 era) | 15-25 kW | Air with hot/cold aisle |
| GPU (H100 era) | 40-70 kW | Rear-door heat exchangers, direct-to-chip liquid |
| GPU (B200/GB200 era) | 100-150 kW | Full liquid cooling (direct-to-chip + CDU) |

### Cooling Architectures

| Method | PUE Impact | Water Use | Density Support | Capital Cost |
|--------|-----------|-----------|-----------------|--------------|
| **Air-cooled (DX)** | 1.3-1.5 | None | <20 kW/rack | Low |
| **Evaporative** | 1.1-1.3 | High | <30 kW/rack | Low-Medium |
| **Rear-door HX** | 1.15-1.3 | Varies | 20-50 kW/rack | Medium |
| **Direct-to-chip liquid** | 1.05-1.2 | Low | 40-120 kW/rack | High |
| **Immersion (single phase)** | 1.02-1.1 | None | 100+ kW/rack | High |
| **Immersion (two phase)** | 1.02-1.08 | None | 100+ kW/rack | Very High |

## Efficiency Metrics

| Metric | Definition | Best-in-Class |
|--------|-----------|---------------|
| **PUE** | Total facility power / IT load power | 1.05-1.10 |
| **WUE** | Annual water usage (L) / IT energy (kWh) | 0.2-0.5 L/kWh |
| **CUE** | CO2 emissions (kg) / IT energy (kWh) | <0.1 (renewables) |
| **ERE** | Energy reuse effectiveness (accounts for waste heat capture) | <1.0 possible |

## Regulatory Landscape

### Key Regulators

| Body | Jurisdiction | Impact |
|------|-------------|--------|
| **FERC** | Interstate transmission, wholesale markets | Interconnection rules, market design |
| **State PUCs** | Retail rates, utility planning | Rate structures, IRP approval |
| **ISO/RTOs** | Grid operations, queue management | Interconnection studies, dispatch |
| **EPA** | Emissions standards | NAAQS, GHGRP reporting |
| **Local/County** | Permitting, zoning | Land use, noise, water permits |

### Rate Structure Issues

Datacenter operators increasingly face:
- **Demand charges** — penalize high peak-to-average ratios
- **Economic development rates** — discounted tariffs to attract load
- **Interruptible rates** — lower cost if willing to curtail during grid stress
- **Wholesale market participation** — behind-the-meter generation can participate in capacity markets

## Key Metrics

| Metric | What It Tells You |
|--------|-------------------|
| **LCOE ($/MWh)** | Levelized cost of electricity from a generation source |
| **Capacity factor** | Actual output / theoretical max — indicates reliability |
| **Interconnection queue position** | Timeline to grid access |
| **Heat rate (BTU/kWh)** | Thermal efficiency of gas generation |
| **PPA price ($/MWh)** | Contracted renewable cost |
| **Grid carbon intensity (gCO2/kWh)** | Emissions per unit of grid electricity |

## Data Sources

- EIA (Form 860, 861, 923) — generator inventory, utility data, fuel receipts
- FERC (Form 714, OASIS) — transmission, interconnection
- ISO/RTO OASIS portals — queue data, market prices
- DOE Annual Energy Outlook — long-range forecasts
- The Green Grid — PUE/WUE methodology and benchmarks
- ASHRAE TC 9.9 — thermal guidelines for datacom equipment
- EPA eGRID — emissions factors by grid region
- Lazard LCOE and LCOS — annual generation cost benchmarks
- S&P Global / BloombergNEF — PPA pricing, renewable project tracker
