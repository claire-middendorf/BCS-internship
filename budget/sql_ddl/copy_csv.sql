COPY budget.dev.budget_staging
FROM '/home/wolf_1900/Desktop/budget/budget_raw.csv'
DELIMITER ',' CSV HEADER;
