## Zephyr Bank — Transaction Health Dashboard
## 📊 Dashboard Preview
### Overview
![Image](https://github.com/bertafrn/Portfolio/blob/main/Power%20BI%20Project/Assets/DataDNA%20Dataset%20Challenge%20-%202026-06%20-%20UK%20Fintech%20Neobank%20Digital%20Transaction%20Health%20Monitor_page-0001.jpg?raw=true)

### Risk & Fraud
![Image](https://github.com/bertafrn/Portfolio/blob/main/Power%20BI%20Project/Assets/DataDNA%20Dataset%20Challenge%20-%202026-06%20-%20UK%20Fintech%20Neobank%20Digital%20Transaction%20Health%20Monitor_page-0002.jpg?raw=true)

### Customer Insights
![Image](https://github.com/bertafrn/Portfolio/blob/main/Power%20BI%20Project/Assets/DataDNA%20Dataset%20Challenge%20-%202026-06%20-%20UK%20Fintech%20Neobank%20Digital%20Transaction%20Health%20Monitor_page-0003.jpg?raw=true)

### Revenue & Channel
![Image](https://github.com/bertafrn/Portfolio/blob/main/Power%20BI%20Project/Assets/DataDNA%20Dataset%20Challenge%20-%202026-06%20-%20UK%20Fintech%20Neobank%20Digital%20Transaction%20Health%20Monitor_page-0004.jpg?raw=true)


## 📌 Project Overview
Analytical dashboard for Zephyr Bank's H1 2026 transaction health review, covering fraud exposure, fee revenue, and operational performance across digital banking channels.
- **Role**: Data Analyst (Risk & Product team)
- **Period analyzed**: January–May 2026
- **Volume**: ~1,500 transactions, 20 customers, 18 merchant categories
- **Stakeholders**: Risk, Finance, Product, Compliance

## 🛠️ Tech Stack
- MySQL — data transformation & view creation
- Power BI — dashboard & DAX measures
- Power Query — data type cleaning

## 📂 Repository Structure
- [Challenge](CHALLENGE_BRIEF.md)
- [Link Challenge](https://datadna.onyxdata.co.uk/challenges/june-2026-datadna-uk-fintech-neobank-digital-transaction-health-monitor-analytics-challenge/))

## 🔄 Workflow

### 1. Data Transformation (SQL)
Raw CSVs were loaded into MySQL, then transformed:
- Converted `transaction_date` and `transaction_datetime` from string (M/D/YYYY) to proper DATE/DATETIME format
- Built a master view `vw_transactions_full` joining fact table with all 3 dimension tables (customer, transaction_type, merchant_category)
- Added derived columns: `tenure_months`, `tenure_band` (customer account age categorization)

### 2. Power BI Connection
- Connected Power BI Desktop to MySQL via **Get Data → ODBC**
- Imported `vw_transactions_full` as a single source table (avoids relationship fan-out issues)
- Added a separate `DateTable` for time intelligence, related 1:* to `transaction_date`
- Fixed boolean column types (`kyc_verified`, `is_domestic`, `is_flagged_fraud`) via Power Query data type transform

### 3. DAX Measures
Key measures built for the analysis:
- Volume & value: `Total Transactions`, `Total Value GBP`
- Risk: `Fraud Rate`, `Fraud Over-Index`, `Risk Score`
- Revenue: `Fee Leakage GBP`, `Avg Fee per Transaction`
- Segmentation: `Tenure Band`, `Decline Rate by Channel`

### 4. Dashboard Pages
| Page | Focus |
|---|---|
| Overview | Monthly trends, fraud/decline clustering, anomalies |
| Risk & Fraud | Fraud exposure, over-indexing, highest risk transactions |
| Customer Insights | Segment behavior, tenure, top customers |
| Revenue & Channel | Fee leakage, channel performance, domestic vs international |

## 🔑 Key Findings
1.  One customer outlier skews Premium segment data — Rajan Mehta accounts for £1.12M (~59%) of total £1.9M transaction value, almost entirely via Web. Should be isolated   before drawing segment conclusions.
2. International transfer fees are significantly under-charged — actual fees (£100.39) vs typical fee (£500) across 200 transactions, the largest fee leakage gap in the     dataset.
3. Fraud concentrates in KYC-verified customers, not unverified ones — 100% of 300 fraud cases came from KYC-verified accounts; non-KYC fraud rate is 0% (small sample caveat: only 4/20 customers).
4. Five UK regions show 100% transaction failure rates — North West, Scotland, South East, Wales, Yorkshire — pointing to a systemic regional infrastructure issue, reinforced by ATM Network having the highest decline rate overall.
5. Fraud risk varies nearly 3x across merchant categories — from 11% (Groceries, Travel) to 31% (Fuel, Online Retail); Gambling confirms fraud over-indexing, but risk_flag ratings don't fully align with actual fraud rates.
