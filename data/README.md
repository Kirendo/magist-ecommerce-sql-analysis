# Data

The raw CSVs aren't included in this repo — they're 170+ MB combined and licensed CC BY-NC-SA 4.0 (non-commercial, share-alike), so redistributing them here isn't appropriate. The pre-aggregated query results used for the Tableau dashboard are in `/exports` instead.

## Getting the raw data

1. Download the **Brazilian E-Commerce Public Dataset by Olist** from Kaggle: https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
2. You'll get these files (renamed below to match the table names used in `sql/01_schema.sql`):

| Kaggle file | Table |
|---|---|
| `olist_geolocation_dataset.csv` | `geo` |
| `olist_customers_dataset.csv` | `customers` |
| `olist_sellers_dataset.csv` | `sellers` |
| `product_category_name_translation.csv` | `category_translation` |
| `olist_products_dataset.csv` | `products` |
| `olist_orders_dataset.csv` | `orders` |
| `olist_order_items_dataset.csv` | `order_items` |
| `olist_order_payments_dataset.csv` | `order_payments` |
| `olist_order_reviews_dataset.csv` | `order_reviews` |

3. Load each CSV into its matching table (`LOAD DATA INFILE` in MySQL, or any GUI client's import feature).
4. Run `sql/02_data_exploration.sql` to confirm the row counts match what's described in the main README.

Note: the Kaggle column names differ slightly from the schema here (e.g. `geolocation_zip_code_prefix` vs. `zip_code_prefix`) — rename on import or adjust the `LOAD DATA` column mapping.
