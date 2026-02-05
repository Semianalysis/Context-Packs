# Data Sources

## SemiAnalysis API (Primary)

Base URL: `https://api.semianalysis.com`

### Authentication

Two-step flow:
1. Exchange `uuid` + `api_key` for JWT via POST `/api/token`
2. Use JWT as Bearer token for all other endpoints

```bash
# Step 1: Get JWT
curl -X POST https://api.semianalysis.com/api/token \
  -H "Content-Type: application/json" \
  -d '{"uuid": "YOUR_UUID", "api_key": "YOUR_API_KEY"}'

# Response: {"status": "ok", "token": "eyJ..."}

# Step 2: Use token
curl -H "Authorization: Bearer $TOKEN" \
  "https://api.semianalysis.com/api/accelerator_model/supply"
```

**Token lifetime**: 1 hour. Implement refresh before expiry.

**Audience validation**: Each endpoint validates JWT `aud` claim matches resource.

---

### Endpoints

#### Token Exchange
| Method | Path | Rate | Auth | Description |
|--------|------|------|------|-------------|
| POST | `/api/token` | 30/min | none | Exchange uuid + api_key for JWT |

**Body**: `{"uuid": "...", "api_key": "..."}`

---

#### Accelerator Model API
| Method | Path | Rate | Auth | Description |
|--------|------|------|------|-------------|
| GET | `/api/accelerator_model/supply` | 120/hr | bearer (aud=accelerator_model) | Supply-side accelerator model |
| GET | `/api/accelerator_model/demand` | 120/hr | bearer (aud=accelerator_model) | Demand-side accelerator model |

**Params**: `page`, `page_size`, `product_name`, `internal`

**Example**:
```bash
curl -H "Authorization: Bearer $TOKEN" \
  "https://api.semianalysis.com/api/accelerator_model/supply?product_name=H100&page=1&page_size=1000"
```

---

#### Chipbook API
| Method | Path | Rate | Auth | Description |
|--------|------|------|------|-------------|
| GET | `/api/chipbook/` | 120/hr | bearer (aud=chipbook) | Import/export chip pricing |
| GET | `/api/chipbook/metadata/chart_titles` | 60/hr | bearer (aud=chipbook) | List available chart titles |

**Params**: `page`, `page_size`, `chart_title`, `include_total`, `internal`

**Example**:
```bash
curl -H "Authorization: Bearer $TOKEN" \
  "https://api.semianalysis.com/api/chipbook/?chart_title=DRAM%20-%20Export%20Prices"
```

---

#### Datacenter Model API
| Method | Path | Rate | Auth | Description |
|--------|------|------|------|-------------|
| GET | `/api/datacenter_model/` | 120/hr | bearer (aud=datacenter_model) | Datacenter model records |
| GET | `/api/pq/datacenter_model` | 120/hr | entra delegated | PowerQuery route (Excel) |

**Params**: `page`, `page_size`, `company`, `country`, `internal`

---

#### GPU Pricing API
| Method | Path | Rate | Auth | Description |
|--------|------|------|------|-------------|
| GET | `/api/gpu_pricing/` | 120/hr | bearer (aud=gpu_pricing) | Cloud GPU price observations |
| GET | `/api/gpu_pricing/h100_index` | 120/hr | bearer (aud=h100_index) | H100 index data |

**Params**: `page`, `page_size`, `gpu_name`, `min_measurement_datetime`, `max_measurement_datetime`, `include_total`, `internal`

**Example**:
```bash
curl -H "Authorization: Bearer $TOKEN" \
  "https://api.semianalysis.com/api/gpu_pricing/?gpu_name=H100&page=1&page_size=200"
```

---

#### Bloomberg Financials API
| Method | Path | Rate | Auth | Description |
|--------|------|------|------|-------------|
| GET | `/api/bbg_quarterly_financials/` | 120/hr | bearer (aud=bbg_quarterly_financials) | Quarterly financials |
| GET | `/api/bbg_quarterly_financials/metadata` | 60/hr | bearer (aud=bbg_quarterly_financials) | Available columns + identifiers |

**Params**: `identifier`, `columns`, `min_date`, `max_date`, `page`, `page_size`, `flat`

**Example**:
```bash
curl -H "Authorization: Bearer $TOKEN" \
  "https://api.semianalysis.com/api/bbg_quarterly_financials/?identifier=AAPL%20US%20Equity"
```

---

#### Taiwan Company Revenues API
| Method | Path | Rate | Auth | Description |
|--------|------|------|------|-------------|
| GET | `/api/taiwan_company_revenues/` | 120/hr | bearer (aud=taiwan_company_revenues) | Taiwan company revenues |
| GET | `/api/taiwan_company_revenues/metadata/chart_titles` | 60/hr | bearer (aud=taiwan_company_revenues) | Available chart titles |

**Params**: `page`, `page_size`, `chart_title`, `include_total`, `internal`

---

#### WordPress Markdown API
| Method | Path | Rate | Auth | Description |
|--------|------|------|------|-------------|
| GET | `/api/wordpress/institutional/{slug}.md` | 60/hr | bearer (aud=institutional_markdown) | Article as Markdown |
| GET | `/api/wordpress/institutional` | 60/hr | bearer (aud=institutional_markdown) | Article metadata |
| GET | `/api/wordpress/institutional/list` | 60/hr | bearer (aud=institutional_markdown) | List all articles |

**Params (list)**: `page`, `per_page`
**Params (metadata)**: `slug` or `url`

**Example**:
```bash
# Get article as markdown
curl -H "Authorization: Bearer $TOKEN" \
  "https://api.semianalysis.com/api/wordpress/institutional/foundry-model.md"

# List articles
curl -H "Authorization: Bearer $TOKEN" \
  "https://api.semianalysis.com/api/wordpress/institutional/list?page=1&per_page=50"
```

---

### Common Parameters

| Param | Type | Default | Description |
|-------|------|---------|-------------|
| `page` | int | 1 | Page number |
| `page_size` | int | 500-1000 | Results per page |
| `include_total` | bool | true | Include total count in response |
| `internal` | bool | false | Include employee-only fields |

### Rate Limits

| Endpoint Type | Limit |
|---------------|-------|
| Data endpoints | 120/hour |
| Metadata endpoints | 60/hour |
| Token exchange | 30/minute |

---

## External Sources

### Linkup (Web Search)
Real-time web search for current events, news, documentation.

### Financial Modeling Prep
Public company financials, SEC filings, stock data.
API docs: https://financialmodelingprep.com/developer/docs

### AssemblyAI
Audio/video transcription.
API docs: https://www.assemblyai.com/docs

### FRED (Federal Reserve Economic Data)
765k+ economic time series: GDP, inflation, employment, interest rates, industrial production.
- **Rate limit**: 120 requests/min (effectively unlimited)
- **Key series**: Industrial production, capacity utilization, trade data, PPI
- API docs: https://fred.stlouisfed.org/docs/api/fred/

```python
# Example: Get semiconductor industrial production
import httpx
FRED_API_KEY = os.getenv("FRED_API_KEY")
url = f"https://api.stlouisfed.org/fred/series/observations"
params = {
    "series_id": "IPG3344S",  # Semiconductor manufacturing
    "api_key": FRED_API_KEY,
    "file_type": "json"
}
resp = httpx.get(url, params=params)
```

### EdgarTools (SEC EDGAR)
SEC filings programmatic access - no API key required.
- **Rate limit**: 10 requests/sec (EDGAR policy)
- **Forms**: 10-K, 10-Q, 8-K, DEF 14A, Form 4, S-1
- Docs: https://github.com/dgunning/edgartools

```python
from edgar import Company
company = Company("NVDA")
filings = company.get_filings(form="10-K")
```
