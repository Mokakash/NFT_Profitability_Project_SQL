-- Data Exploration (EDA)

----------------------------------------------
-- Profit Analysis:

-- What is the Total Profit/Loss for each transaction?
ALTER TABLE nfts
ADD COLUMN `Profit/Loss` DECIMAL(10, 4) AS (`Sell Price (ETH)` - `Initial + Fee (ETH)`);

-- What is the Total Profit/Loss from all transactions?
SELECT SUM(`Profit/Loss`) AS Total_Profit_Loss
FROM nfts;

-- Which individual trade resulted in the highest Profit?
SELECT MAX(`Profit/Loss`) AS Highest_Profit
FROM nfts;

-- Additional: show the full trade details associated with the highest profit.
SELECT *
FROM nfts
WHERE `Profit/Loss` = (
    SELECT MAX(`Profit/Loss`)
    FROM nfts
);

-- Which individual trade resulted in the highest Loss?
SELECT MIN(`Profit/Loss`) AS Highest_Loss
FROM nfts;

----------------------------------------------
-- Profitability by Transaction Methods:

-- How many trades were through each method of transaction (minting, secondary trades, or airdrops)?
SELECT Method_Updated, COUNT(*) AS Trade_Count
FROM nfts
GROUP BY Method_Updated
ORDER BY Trade_Count DESC;

-- What are total Profit/Loss for each Method?
SELECT Method_Updated, SUM(`Profit/Loss`) AS Total_Profit_Loss
FROM nfts
GROUP BY Method_Updated
ORDER BY Total_Profit_Loss DESC;

-- What method of transaction generated more profit on average?
SELECT Method_Updated, AVG(`Profit/Loss`) AS Average_Profit_Loss
FROM nfts
GROUP BY Method_Updated
ORDER BY Average_Profit_Loss DESC;

-- Are there any trends indicating which method yielded higher profits overall?
	-- Answer: Yes, it's evident that 'Mint' transactions tend to yield higher profits overall (23.1974), followed by 'Airdrop' with a profit of 1.1390. 
	-- Conversely, 'Secondary' transactions resulted in a significant overall loss of -26639, indicating it was the least profitable method among the analyzed categories.

----------------------------------------------
-- Alpha Group Performance:

-- Which alpha group contributed to the highest profit overall?
SELECT `Alpha Group`, SUM(`Profit/Loss`) AS Total_Profit_Loss
FROM nfts
GROUP BY `Alpha Group`
ORDER BY Total_Profit_Loss DESC
LIMIT 1;

 -- What percentage of the total profit is attributed to this alpha group?
SELECT
    (`Top_AlphaGroup_Profit` / `Total_Profit`) * 100 AS Percentage_Contribution
FROM (
    SELECT SUM(`Profit/Loss`) AS Total_Profit
    FROM nfts
) AllProfit,
(
    SELECT SUM(`Profit/Loss`) AS Top_AlphaGroup_Profit
    FROM nfts
    WHERE `Alpha Group` = (
        SELECT `Alpha Group`
        FROM nfts
        GROUP BY `Alpha Group`
        ORDER BY SUM(`Profit/Loss`) DESC
        LIMIT 1
    )
) TopGroupProfit;

-- What's the average profit per trade for each alpha group?
SELECT `Alpha Group`, AVG(`Profit/Loss`) AS Avg_Profit_Per_Trade
FROM nfts
GROUP BY `Alpha Group`
ORDER BY Avg_Profit_Per_Trade DESC;
-- This shows that while NP Alpha Group achieved the highest profit, it ranks third on the list in terms of average gain per trade.

----------------------------------------------
-- Monthly Ananlysis:

-- Which month showed the highest profit?
SELECT 
    DATE_FORMAT(Date_Updated, '%Y-%m') AS Month_Year,
    SUM(`Profit/Loss`) AS Total_Profit_Loss
FROM nfts
GROUP BY Month_Year
ORDER BY Total_Profit_Loss DESC
LIMIT 1;

-- How did profits vary month by month?
SELECT 
    DATE_FORMAT(Date_Updated, '%Y-%m') AS Month_Year,
    SUM(`Profit/Loss`) AS Total_Profit_Loss
FROM nfts
GROUP BY Month_Year
ORDER BY Month_Year;

-- Is there a seasonal trend in profitability?
SELECT 
    CONCAT('Q', QUARTER(Date_Updated)) AS Quarter,
    AVG(`Profit/Loss`) AS Average_Profitability
FROM nfts
GROUP BY Quarter
ORDER BY Quarter;

----------------------------------------------
-- Wallet Performance:

-- Which wallet made the most profit?
SELECT Wallet, SUM(`Profit/Loss`) AS Total_Profit_Loss
FROM nfts
GROUP BY Wallet
ORDER BY Total_Profit_Loss DESC
LIMIT 1;

-- What's the average profit per trade for each wallet?
SELECT Wallet, AVG(`Profit/Loss`) AS Avg_Profit_Per_Trade
FROM nfts
GROUP BY Wallet
ORDER BY Avg_Profit_Per_Trade DESC;