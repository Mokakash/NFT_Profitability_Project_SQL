-- DATA CLEANING

-- We want 'Date' data type to be 'date' type. Let's quickly verify its current data type.
SHOW COLUMNS FROM nfts LIKE 'Date';

-- 'Date' data type is currently 'Text'. So, let's add a new column 'Date_Updated' to then store date values with correct data type.
ALTER TABLE nfts
ADD COLUMN Date_Updated DATE;

-- Update 'Date_Updated' with date values converted from the 'Date' column in 'MM/DD/YYYY' format
UPDATE nfts
SET Date_Updated = STR_TO_DATE(Date, '%m/%d/%Y');

-- Any records/rows with null or empty values in 'Date_Updated' must be removed. Let's check to see if there is any.
SELECT * FROM nfts 
WHERE Date_Updated IS NULL OR Date_Updated = '';

-- Delete records where 'Date_Updated' is null or empty
DELETE FROM nfts
WHERE Date_Updated IS NULL OR Date_Updated = '';

----------------------------------------------

-- Replace 'Old Wallet' with 'Main' in 'Wallet' column.
UPDATE nfts
SET Wallet = 'Main'
WHERE Wallet = 'Old Wallet';

----------------------------------------------

-- Identify the unique values within the 'Method' column to assess whether cleaning is necessary.
SELECT DISTINCT Method
FROM nfts
ORDER BY Method ASC;

-- Add a new column 'Method_Updated' to store updated 'Method' values.
ALTER TABLE nfts
ADD COLUMN Method_Updated VARCHAR(50);

-- Update 'Method_Updated' based on conditions: '2nd Market' or '2ndary' to 'Secondary', 'Mnt' to 'Mint', else retain original 'Method'.
UPDATE nfts
SET Method_Updated = CASE 
    WHEN Method = '2nd Market' OR Method = '2ndary' THEN 'Secondary'
    WHEN Method = 'Mnt' THEN 'Mint'
    ELSE Method
END;

-- Quick sanity check to see if all the categories in 'Method_Updated' column are coded as expected.
SELECT DISTINCT Method_Updated
FROM nfts
ORDER BY Method_Updated ASC;

----------------------------------------------

-- Change the column name 'Transfer?' to 'Transfer' and adjust the data type.
ALTER TABLE nfts
CHANGE COLUMN `Transfer?` `Transfer` VARCHAR(50); 

-- Add a new column 'Transfer_Updated' to store updated 'Transfer' values.
ALTER TABLE nfts
ADD COLUMN Transfer_Updated VARCHAR(50);

-- Fill 'Transfer_Updated' NULL or empty values with 'NO'.
UPDATE nfts
SET Transfer_Updated = CASE
    WHEN (Transfer IS NULL OR Transfer = '') THEN 'NO'
    ELSE Transfer
END;

----------------------------------------------

-- Remove unnecessary columns
ALTER TABLE nfts
DROP COLUMN `Date`,
DROP COLUMN `NFT Name`,
DROP COLUMN `ITEM`,
DROP COLUMN `Method`,
DROP COLUMN `Location`,
DROP COLUMN `Type`,
DROP COLUMN `Transfer`;