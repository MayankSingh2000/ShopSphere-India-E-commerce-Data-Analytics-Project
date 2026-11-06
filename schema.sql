-- ShopSphere raw schema for PostgreSQL
-- Raw layer: no primary keys on purpose (the data contains duplicates you must find and clean).
-- orders.order_date is TEXT because it arrives in 3 different date formats.

DROP TABLE IF EXISTS returns, order_items, orders, products, customers, marketing_spend CASCADE;

CREATE TABLE customers (
    customer_id          TEXT,
    customer_name        TEXT,
    email                TEXT,
    phone                TEXT,
    gender               TEXT,
    age                  NUMERIC,
    city                 TEXT,
    state                TEXT,
    signup_date          DATE,
    acquisition_channel  TEXT
);

CREATE TABLE products (
    product_id    TEXT,
    product_name  TEXT,
    category      TEXT,
    sub_category  TEXT,
    brand         TEXT,
    supplier_id   TEXT,
    mrp           NUMERIC,
    cost_price    NUMERIC
);

CREATE TABLE orders (
    order_id         TEXT,
    customer_id      TEXT,
    order_date       TEXT,      -- mixed formats, clean later
    ship_date        DATE,
    delivery_date    DATE,
    order_status     TEXT,
    payment_method   TEXT,
    coupon_code      TEXT,
    discount_pct     NUMERIC,
    courier_partner  TEXT,
    shipping_fee     NUMERIC,
    customer_rating  NUMERIC
);

CREATE TABLE order_items (
    order_item_id  INTEGER,
    order_id       TEXT,
    product_id     TEXT,
    quantity       INTEGER,
    unit_price     NUMERIC
);

CREATE TABLE returns (
    return_id       TEXT,
    order_item_id   INTEGER,
    return_date     DATE,
    return_reason   TEXT,
    refund_amount   NUMERIC
);

CREATE TABLE marketing_spend (
    month         TEXT,
    channel       TEXT,
    spend_inr     NUMERIC,
    impressions   BIGINT,
    clicks        BIGINT,
    new_customers INTEGER
);
