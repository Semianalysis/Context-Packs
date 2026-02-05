---
name: finance
description: Financial analysis fundamentals. Reading financials, valuation, metrics, earnings interpretation.
---

# Finance Context Pack

## When to Load

- Company financial analysis
- Earnings interpretation
- Valuation work
- Investment thesis development

## Reading Financial Statements

### Income Statement (P&L)

```
Revenue
- COGS
= Gross Profit (Gross Margin %)
- R&D
- SG&A
= Operating Income (Operating Margin %)
± Other Income/Expense
= Pre-tax Income
- Taxes
= Net Income (Net Margin %)
```

### Key P&L Metrics

| Metric | Formula | What It Tells You |
|--------|---------|-------------------|
| Gross Margin | Gross Profit / Revenue | Product profitability |
| Operating Margin | Op Income / Revenue | Business efficiency |
| Net Margin | Net Income / Revenue | Bottom-line profitability |
| R&D % | R&D / Revenue | Innovation investment |

### Balance Sheet

```
Assets = Liabilities + Equity

Current Assets (cash, receivables, inventory)
+ Non-current Assets (PP&E, intangibles)
= Total Assets

Current Liabilities (payables, short-term debt)
+ Non-current Liabilities (long-term debt)
= Total Liabilities

Shareholders' Equity
```

### Key Balance Sheet Metrics

| Metric | Formula | What It Tells You |
|--------|---------|-------------------|
| Current Ratio | Current Assets / Current Liab | Liquidity |
| Debt/Equity | Total Debt / Equity | Leverage |
| Days Sales Outstanding | (AR / Revenue) × 365 | Collection efficiency |
| Inventory Turns | COGS / Inventory | Inventory efficiency |

### Cash Flow Statement

```
Net Income
+ Non-cash charges (D&A, SBC)
± Working capital changes
= Cash from Operations (CFO)

- CapEx
- Acquisitions
+ Asset sales
= Cash from Investing (CFI)

+ Debt issuance
- Debt repayment
- Dividends
- Buybacks
= Cash from Financing (CFF)

Net Change in Cash = CFO + CFI + CFF
```

### Key Cash Flow Metrics

| Metric | Formula | What It Tells You |
|--------|---------|-------------------|
| Free Cash Flow | CFO - CapEx | Cash available to shareholders |
| FCF Margin | FCF / Revenue | Cash generation efficiency |
| FCF Conversion | FCF / Net Income | Earnings quality |
| CapEx/Revenue | CapEx / Revenue | Capital intensity |

## GAAP vs Non-GAAP

### Common Adjustments

| Item | GAAP | Non-GAAP Treatment |
|------|------|-------------------|
| Stock-based comp | Expense | Often excluded |
| Amortization of intangibles | Expense | Often excluded |
| Restructuring | Expense | Often excluded |
| One-time items | Included | Excluded |

### When to Use Which

- **GAAP**: Legal reporting, comparisons, conservative view
- **Non-GAAP**: Operating performance, management's view, trend analysis

### Red Flags

- Growing GAAP/Non-GAAP divergence
- SBC > 15-20% of revenue
- Serial "one-time" charges
- Aggressive revenue recognition

## Valuation Methods

### Multiples-Based

| Multiple | Formula | Use Case |
|----------|---------|----------|
| P/E | Price / EPS | Mature, profitable |
| EV/Revenue | EV / Revenue | Growth, unprofitable |
| EV/EBITDA | EV / EBITDA | Capital-intensive |
| P/FCF | Price / FCF per share | Cash generators |
| PEG | P/E / Growth rate | Growth at reasonable price |

### Enterprise Value

```
EV = Market Cap + Debt - Cash + Preferred + Minority Interest
```

### DCF (Discounted Cash Flow)

```
Value = Σ (FCF_t / (1+r)^t) + Terminal Value / (1+r)^n

Where:
- FCF_t = Free cash flow in year t
- r = Discount rate (WACC)
- Terminal Value = FCF_n × (1+g) / (r-g)
- g = Terminal growth rate (usually 2-3%)
```

### Comparable Analysis

1. Select peer group
2. Calculate trading multiples
3. Apply to target's metrics
4. Adjust for differences (growth, margins, risk)

## Semiconductor-Specific Metrics

### Revenue Quality

| Metric | Formula | Target |
|--------|---------|--------|
| Book-to-Bill | Orders / Revenue | >1.0 = growing |
| Backlog | Unfilled orders | Visibility |
| Lead Time | Order to delivery | Demand indicator |

### Inventory Health

| Metric | Formula | Watch For |
|--------|---------|-----------|
| Days of Inventory | (Inv / COGS) × 365 | Rising = risk |
| Channel Inventory | Distributor stock | Excess = correction coming |
| Inventory Write-down | As % of inventory | Quality issues |

### Margin Drivers

| Factor | Impact on Margin |
|--------|------------------|
| Mix shift (to higher-value) | ↑ |
| Utilization | ↑ at higher util |
| Node transition | ↓ initially, ↑ at maturity |
| ASP changes | Direct impact |

## Earnings Call Analysis

### What to Listen For

| Section | Key Information |
|---------|-----------------|
| Prepared remarks | Guidance, strategic priorities |
| Segment detail | Where growth is coming from |
| Q&A | What analysts are worried about |
| Tone | Confidence level |

### Red Flags in Calls

- Vague answers to direct questions
- Blaming macro for company-specific issues
- Changing metrics definitions
- Excessive focus on non-GAAP
- Management selling stock

### Key Phrases

| Phrase | Translation |
|--------|-------------|
| "Investing for growth" | Margins will compress |
| "Rightsizing" | Layoffs coming |
| "Challenging environment" | Missing numbers |
| "Prudent" | Conservative/scared |
| "Remain confident" | Whistling past graveyard |

## Financial Modeling

### Revenue Build

```
Revenue = Units × ASP
Revenue = Customers × ARPU
Revenue = TAM × Market Share
Revenue = Prior Year × (1 + Growth)
```

### Margin Modeling

```
Gross Margin = f(mix, utilization, pricing, costs)
Operating Margin = Gross Margin - OpEx%
```

### Working Capital

```
NWC = Receivables + Inventory - Payables
Cash Conversion Cycle = DSO + DIO - DPO
```

## Ratio Analysis Framework

### Profitability

| Ratio | Good | Watch |
|-------|------|-------|
| Gross Margin | >40% (semi) | Declining |
| Operating Margin | >20% | <10% |
| ROE | >15% | <10% |
| ROIC | >WACC | <WACC |

### Liquidity

| Ratio | Good | Watch |
|-------|------|-------|
| Current Ratio | >1.5 | <1.0 |
| Quick Ratio | >1.0 | <0.5 |
| Cash/Debt | >0.5 | <0.2 |

### Leverage

| Ratio | Good | Watch |
|-------|------|-------|
| Debt/EBITDA | <2.0 | >4.0 |
| Interest Coverage | >5x | <2x |
| Debt/Equity | <0.5 | >1.5 |

## Key Data Sources

| Source | Content |
|--------|---------|
| SEC EDGAR | 10-K, 10-Q, 8-K filings |
| Earnings calls | Transcripts, webcasts |
| Investor presentations | Management narratives |
| Proxy (DEF 14A) | Compensation, governance |
| Bloomberg/FactSet | Consensus estimates |

## Quarterly Earnings Calendar

Semis typically report:
- **January**: Q4/FY (different FY ends)
- **April**: Q1
- **July**: Q2
- **October**: Q3

Watch for:
- Pre-announcements (usually bad news)
- Guidance changes
- Analyst revisions post-earnings
