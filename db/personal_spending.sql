DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS retailers;
DROP TABLE IF EXISTS tags;

CREATE TABLE tags(
  id SERIAL8 PRIMARY KEY,
  tag_name VARCHAR(255)
);

CREATE TABLE retailers(
  id SERIAL8 PRIMARY KEY,
  retailer_name VARCHAR(255)
);

CREATE TABLE transactions(
  id SERIAL8 PRIMARY KEY,
  transaction_date DATE,
  item_name VARCHAR(255),
  cost FLOAT,
  retailer_id INT2 REFERENCES retailers(id) ON DELETE CASCADE,
  tag_id INT2 REFERENCES tags(id) ON DELETE CASCADE
);
