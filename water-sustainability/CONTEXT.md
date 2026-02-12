---
name: water-sustainability
description: Datacenter water usage, cooling impact, carbon accounting, and sustainability reporting frameworks.
---

# Water & Sustainability Context Pack

## When to Load

- Datacenter water consumption analysis
- Cooling technology environmental impact
- Carbon accounting (Scope 1/2/3) for compute
- ESG reporting and sustainability commitments
- Water stress and watershed risk assessment

## Water Usage in Datacenters

### Where Water Goes

Datacenter water consumption comes from two sources:

| Source | Type | Mechanism |
|--------|------|-----------|
| **Operational (direct)** | Cooling | Evaporative cooling towers, humidification |
| **Upstream (indirect)** | Power generation | Thermoelectric plant cooling (coal, gas, nuclear) |

Upstream water use is often larger than operational water use. A datacenter running on coal-heavy grid power may consume more water indirectly through power generation than directly through its cooling towers.

### Cooling Type Impact on Water

| Cooling Method | Operational Water Use | WUE Range (L/kWh) | Trade-off |
|----------------|----------------------|--------------------| ----------|
| **Air-cooled (DX/dry cooler)** | None | 0 | Higher energy, higher PUE |
| **Evaporative (wet cooling tower)** | High | 1.0-2.5 | Most energy efficient per kW rejected |
| **Adiabatic** | Moderate | 0.3-1.0 | Evaporative assist on hot days only |
| **Direct-to-chip liquid** | None-Low | 0-0.5 | Closed loop, heat rejected to dry cooler or tower |
| **Immersion** | None | 0 | Closed loop, heat rejected to dry cooler |

### Water Consumption vs Withdrawal

| Term | Definition | Why It Matters |
|------|-----------|---------------|
| **Withdrawal** | Water taken from source (river, aquifer, municipal) | Total demand on water source |
| **Consumption** | Water that does not return to source (evaporated, incorporated) | Permanent removal from watershed |
| **Discharge** | Water returned to source (potentially at different temperature/quality) | Thermal pollution, treatment needs |

Evaporative cooling towers consume nearly all withdrawn water (>95% evaporated). Once-through cooling withdraws much more but consumes less (~2-5% evaporated, rest returned warmer).

## Water Usage Effectiveness (WUE)

### Definition

```
WUE = Annual site water usage (liters) / Annual IT energy usage (kWh)
```

### Benchmarks

| Operator | Reported WUE | Cooling Strategy |
|----------|-------------|------------------|
| **Google (global avg)** | ~0.55 L/kWh | Mix of evaporative and dry cooling |
| **Microsoft (global avg)** | ~0.49 L/kWh | Adiabatic + air-side economizer |
| **Meta (global avg)** | ~0.26 L/kWh | Heavy use of free air cooling, evaporative assist |
| **Equinix (global avg)** | ~1.0 L/kWh | Varies widely by facility age and location |
| **Industry average** | ~1.8 L/kWh | Many older facilities use full evaporative |

### WUE Limitations

- Does not capture upstream water for electricity generation
- Regional water stress is not reflected (1 L in Phoenix is not the same as 1 L in Oregon)
- Seasonal variation not captured in annual metric
- No standard for measurement boundary (some include landscape irrigation, some don't)

## Water Stress Context

### What Makes a Location Water-Stressed

| Factor | Description |
|--------|-------------|
| **Baseline water stress** | Ratio of total withdrawals to available supply |
| **Groundwater depletion** | Rate of aquifer extraction vs recharge |
| **Drought frequency** | Historical and projected drought events |
| **Regulatory constraints** | Water rights, permit limitations, allocation priority |
| **Competing demand** | Agricultural, municipal, industrial users in same watershed |

### High-Stress Datacenter Regions

| Region | Stress Level | Primary Issue | Major Operators |
|--------|-------------|---------------|----------------|
| **Phoenix, AZ** | Extremely high | Groundwater depletion, Colorado River allocation | Microsoft, Google, Meta |
| **Northern Virginia** | Moderate-High | Potomac watershed pressure, rapid growth | All major operators |
| **Dallas-Fort Worth, TX** | High | Periodic drought, growing demand | Multiple |
| **Querétaro, Mexico** | High | Aquifer depletion, agricultural competition | Google, Microsoft |
| **Singapore** | High | Imported water, limited land | Equinix, Google, AWS |
| **The Dalles, OR** | Moderate | Columbia River concerns, Google expansion controversy | Google |

### Low-Stress Datacenter Regions

| Region | Why Lower Stress | Operators |
|--------|-----------------|-----------|
| **Nordics (Finland, Sweden)** | Abundant water, cool climate enables free cooling | Google, Microsoft |
| **Iowa** | Adequate water, cool climate | Meta, Microsoft, Google |
| **Quebec, Canada** | Hydropower, cool climate, abundant water | Google, AWS |

## Carbon Accounting

### Scope Definitions (GHG Protocol)

| Scope | Source | Datacenter Examples |
|-------|--------|--------------------|
| **Scope 1** | Direct emissions from owned/controlled sources | Diesel generators, refrigerant leaks, onsite gas generation |
| **Scope 2** | Indirect emissions from purchased electricity/heat | Grid electricity for IT load + cooling + lighting |
| **Scope 3** | All other indirect emissions in value chain | Embodied carbon in servers, construction, employee travel |

### Scope 2 Accounting Methods

| Method | How It Works | Strengths | Weaknesses |
|--------|-------------|-----------|------------|
| **Location-based** | Grid average emissions factor for facility location | Simple, consistent | Doesn't reflect renewable procurement |
| **Market-based** | Uses contractual instruments (RECs, PPAs) to claim clean energy | Reflects procurement decisions | Can overstate impact if using unbundled RECs |

Most operators report both methods. Market-based is typically much lower due to PPA/REC procurement. Location-based reflects actual grid impact.

### Embodied Carbon

Hardware manufacturing is a growing share of lifecycle emissions as operational energy gets cleaner:

| Component | Embodied Carbon | Lifecycle Share (3-year) |
|-----------|----------------|------------------------|
| **Server (CPU/GPU + memory + storage)** | 500-2000 kg CO2e | 10-30% (growing as grid cleans) |
| **Network equipment** | 100-500 kg CO2e | 5-10% |
| **Building/infrastructure** | Varies widely | 10-20% (amortized over 20+ years) |
| **Operational energy** | Depends on grid mix | 50-80% (declining with renewables) |

## Sustainability Reporting Frameworks

| Framework | Scope | Relevance |
|-----------|-------|-----------|
| **GHG Protocol** | Carbon accounting standard | Foundation for all corporate emissions reporting |
| **CDP (Carbon Disclosure Project)** | Annual climate/water/forest questionnaire | Investors use CDP scores for ESG evaluation |
| **SBTi (Science Based Targets)** | Emissions reduction target validation | Validates if reduction targets align with Paris Agreement |
| **TCFD / ISSB** | Climate financial risk disclosure | Board-level climate risk reporting |
| **RE100** | 100% renewable electricity commitment | Tracks annual renewable energy matching |
| **24/7 CFE Compact** | Hourly carbon-free energy matching | More rigorous than annual matching |

### Operator Commitments

| Operator | Carbon Target | Water Target | Renewable Target |
|----------|--------------|-------------|-----------------|
| **Google** | Net-zero by 2030 | Replenish 120% of water consumed by 2030 | 24/7 CFE by 2030 |
| **Microsoft** | Carbon negative by 2030 | Water positive by 2030 | 100% renewable (annual) by 2025 |
| **Amazon** | Net-zero by 2040 | Water positive by 2030 | 100% renewable (annual) by 2025 |
| **Meta** | Net-zero by 2030 | Water positive by 2030 | 100% renewable (annual) achieved |
| **Apple** | Carbon neutral (entire supply chain) by 2030 | N/A (minimal datacenter footprint) | 100% renewable achieved |

## Key Metrics

| Metric | What It Tells You |
|--------|-------------------|
| **WUE (L/kWh)** | Operational water efficiency — lower is better |
| **PUE** | Energy overhead — lower means less waste heat to reject |
| **CUE (kgCO2/kWh)** | Carbon intensity of IT energy |
| **Scope 1/2/3 emissions** | Total carbon footprint by category |
| **% renewable energy** | Share of electricity from clean sources |
| **Water stress index** | Local watershed risk — context for WUE |
| **Embodied carbon per server** | Manufacturing emissions per unit of IT capacity |

## Data Sources

- The Green Grid — WUE, PUE, CUE methodology and white papers
- WRI Aqueduct — global water stress mapping and risk assessment
- EPA eGRID — grid emissions factors by subregion
- EPA GHGRP — facility-level emissions data
- ASHRAE TC 9.9 — thermal guidelines, cooling best practices
- DOE Better Buildings — federal energy efficiency programs and case studies
- Operator sustainability reports — Google, Microsoft, Amazon, Meta (annual)
- CDP — corporate climate and water disclosure responses
- GHG Protocol — Scope 1/2/3 accounting standards
- IEA — global electricity and emissions data
