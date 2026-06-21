CREATE DATABASE zephyr;
SELECT * FROM customer;
SELECT * FROM fact_transactions_updated;
SELECT * FROM merchant_category;
SELECT * FROM transaction_type;

--- Replace data type string to date for column transaction_date & transaction_datetime
UPDATE fact_transactions_updated
SET transaction_date= STR_TO_DATE(transaction_date, '%m/%d/%Y');

UPDATE fact_transactions_updated
SET transaction_datetime = STR_TO_DATE(transaction_datetime, '%m/%d/%Y %H:%i');

--- Create View 
CREATE VIEW vw_transactions_full AS
SELECT
    f.*,
    c.customer_name,
    c.age_band,
    c.region,
    c.customer_segment,
    c.kyc_verified,
	c.account_open_date,
    t.type_name,
    t.channel,
    t.is_domestic,
    t.typical_fee_gbp,
    m.category_name,
    m.sector,
    m.risk_flag

FROM fact_transactions_updated f
LEFT JOIN customer c
    ON f.customer_id = c.customer_id
LEFT JOIN transaction_type t
    ON f.transaction_type_id = t.transaction_type_id
LEFT JOIN merchant_category m
    ON f.merchant_category_id = m.merchant_category_id;

--- Update View
  CREATE OR REPLACE VIEW vw_transactions_full AS
SELECT
    f.*,
    c.customer_name,
    c.age_band,
    c.region,
    c.customer_segment,
    c.kyc_verified,
    t.type_name,
    t.channel,
    t.is_domestic,
    t.typical_fee_gbp,
    m.category_name,
    m.sector,
    m.risk_flag,
    c.account_open_date,
    TIMESTAMPDIFF(MONTH, c.account_open_date, '2026-06-01') AS tenure_months,
  CASE
    WHEN TIMESTAMPDIFF(MONTH, c.account_open_date, '2026-06-01') < 12 THEN 'New (<1yr)'
    WHEN TIMESTAMPDIFF(MONTH, c.account_open_date, '2026-06-01') < 36 THEN 'Mid (1-3yr)'
    ELSE 'Mature (3yr+)'
  END AS tenure_band

FROM fact_transactions_updated f
LEFT JOIN customer c
    ON f.customer_id = c.customer_id
LEFT JOIN transaction_type t
    ON f.transaction_type_id = t.transaction_type_id
LEFT JOIN merchant_category m
    ON f.merchant_category_id = m.merchant_category_id;