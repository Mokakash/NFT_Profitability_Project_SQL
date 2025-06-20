# NFT Profitability Analysis
Welcome to the NFT Profitability Analysis project! Similar to stocks or crypto trading, in the world of NFTs, understanding the best trading methods and where to spend your time efficiently in countless alpha groups for upcoming project insights is crucial due to daily time constraints. Using SQL, I dive deep into my 2022 NFT trading data to uncover the most profitable trading methods (Mint vs. Secondary Trades vs. Airdrops), identify seasonal trends, and discover the best alpha groups to gather early intel on upcoming NFTs. 

## Objectives 
The primary objectives of this project encompass a comprehensive analysis of 2022 NFT trading data across five key categories. These categories include:
+ Profit Analysis
+ Profitability by Trading Methods
+ Alpha Group Performance
+ Monthly Analysis
+ Wallet Performance

Each category aims to address specific sub-questions, utilizing custom SQL code to delve into understanding profit generation, trading method efficiency, alpha group contributions, monthly trends, and individual wallet performance within the NFT trading landscape.

To achieve this, the initial steps involve cleaning the raw data followed by conducting exploratory data analysis (EDA). 

## Data Sources 
To conduct this analysis, I utilized my 2022 NFT transaction data stored in the file named ['NFT_Raw_Data.csv'](https://github.com/Mokakash/NFT_Profitability_Project_SQL/blob/main/NFT_Raw_Data.csv), available in the repository.

Note:
+ The displayed values are in Ethereum (ETH), with four decimals due to the currency's high price.
+ For security purposes, NFT names have been removed, and hash transactions have not been included. 
+ Names of Alpha groups have been intentionally abbreviated to maintain confidentiality and protect sensitive information. 

## Data Cleaning
I conducted data cleaning on the NFT raw data to ensure its suitability for effective exploratory data analysis. The following modifications were made to refine and prepare the dataset:

+ **Removed rows with NO dates.**
+ **Change Date column data type from ‘text’ to ‘date’** - This alteration was made to facilitate future trend analysis over time. Converting the data type from 'text' to 'date' allows for better chronological analysis, enabling trends to be easily identified and understood based on date-related information.
+ **In the 'Wallet' column, replaced 'Old Wallet' values with 'Main'** - this modification serves to distinctly highlight and identify the primary or main wallet, offering a clearer representation of the dataset.
+ **In the 'Method' column, set '2nd Market' or '2ndary' to 'Secondary', and 'Mnt' to 'Mint'** - This transformation is aimed at categorizing and standardizing transaction methods. This standardization enhances data consistency and readability, providing a more coherent and understandable representation of the different transaction methods.
+ **In the 'Transfer' column, filled NULL or empty values with 'NO' value** - Filling null or empty values with 'NO' was performed to indicate instances where no transfer was conducted. This adjustment ensures that empty fields are interpreted uniformly across the dataset, clearly signifying the absence of any transfer in those particular entries.
+ **Columns created:**
  + Date_Updated
  + Method_Updated
  + Transfer_Updated
+ **Columns removed** – The columns listed below were identified as unnecessary for this analysis. Their removal aimed to streamline the analysis, enhancing focus, efficiency, and ease of interpretation.
  + NFT Name
  + ITEM
  + Date
  + Method
  + Location
  + Transfer
  + Type

The cleaned dataset, named ['NFT_Cleaned_Data.csv'](https://github.com/Mokakash/NFT_Profitability_Project_SQL/blob/main/NFT_Cleaned_Data.csv), is available in the repository.
Additionally, the MySQL code used for data cleaning can be found in the repository as ['NFT_Data_Cleaning.sql'](https://github.com/Mokakash/NFT_Profitability_Project_SQL/blob/main/NFT_Data_Cleaning.sql), providing transparency and insight into the steps taken to refine the dataset.

## Questions and Insights (EDA)
Here are outlined questions I aimed to answer and the key insights/findings I have discovered from the analysis.

### Profit Analysis:
+ **What is the total profit/loss from all transactions?** 21.6725 ETH profit - This indicates an overall profitable year in 2022. Despite individual trades resulting in both profit and loss, the cumulative result across all transactions shows a positive outcome, affirming the overall success of trading activities throughout the year.
+ ![image1](https://github.com/Mokakash/NFT_Profitability_Project_SQL/blob/main/Images/01_Total_Profit_Loss.png?raw=true)
+ **Individual trade with the highest Profit** - The individual trade that resulted in the highest profit was 3.2484 ETH. This trade was associated with the NP alpha group and utilized the Mint trading method.
+ ![image2](https://github.com/Mokakash/NFT_Profitability_Project_SQL/blob/main/Images/02_Highest_Profit.png?raw=true)
+ **Individual trade with the highest Loss** - The individual trade that resulted in the highest loss was -2.5372 ETH. This trade, similar to the highest profit trade, was associated with the NP alpha group and utilized the Mint trading method.
+ ![image3](https://github.com/Mokakash/NFT_Profitability_Project_SQL/blob/main/Images/03_Highest_Loss.png?raw=true)
### Profitability by Transaction Methods:
+ **How many trades were through each method of transaction (minting, secondary trades, or airdrops)?** Minting recorded 370 trades, indicating its prevalence, followed by 143 trades through Secondary transactions and a smaller count of 29 trades via Airdrops.
+ ![image4](https://github.com/Mokakash/NFT_Profitability_Project_SQL/blob/main/Images/04_Trade_Count.png?raw=true)
+ **What is the total Profit/Loss for each Method?** The Minting method recorded 370 trades, indicating its prevalence, followed by 143 trades through Secondary transactions and a smaller count of 29 trades via Airdrops.
+ ![image5](https://github.com/Mokakash/NFT_Profitability_Project_SQL/blob/main/Images/05_Total_Profit_Loss_per_Method.png?raw=true)
+ **What method of transaction generated more profit on average?** Minting transactions emerged with the highest average profit of 0.0626 ETH, followed by Airdrops at 0.0392 ETH profit. Conversely, Secondary trades resulted in an average loss of -0.0186 ETH, signifying that, on average, Minting proved to be the most profitable among the analyzed transaction methods.
+ ![image6](https://github.com/Mokakash/NFT_Profitability_Project_SQL/blob/main/Images/06_Avg_Profit_Loss_per_Method.png?raw=true)
+ **Are there any trends indicating which method yielded higher profits overall?** The trends suggest that Minting consistently yielded higher profits overall compared to Airdrops and Secondary trades. Despite potentially lower individual profits in some instances, Minting maintained a higher average profit per transaction and a notably higher total profit, indicating its overall profitability as a transaction method during the analyzed period.
### Alpha Group Performance:
+ **Which alpha group contributed to the highest profit overall?** The NP alpha group contributed the highest profit overall, totaling 14.7242 ETH. This indicates that, among the analyzed alpha groups, NP emerged as the most profitable during the specified period when it comes to total profit.
+ ![image7](https://github.com/Mokakash/NFT_Profitability_Project_SQL/blob/main/Images/07_Total_Profit_Loss_per_Group.png?raw=true)
+ **What percentage of the total profit is attributed to this alpha group?** The NP alpha group's amount gained accounts for 68% of the total profit, showcasing its substantial influence on the overall profitability within the analyzed dataset.
+ ![image8](https://github.com/Mokakash/NFT_Profitability_Project_SQL/blob/main/Images/08_Percentage_Contribution.png?raw=true)
+ **What's the average profit per trade for each alpha group?** Despite the NP alpha group contributing the highest total profit, it ranks third in terms of average profit per trade at 0.0598 ETH. The LV alpha group leads with an average profit per trade of 0.1998 ETH, followed by AS at 0.0635 ETH per trade.
+ ![image9](https://github.com/Mokakash/NFT_Profitability_Project_SQL/blob/main/Images/09_Avg_Profit_Per_Group.png?raw=true)
### Monthly Analysis:
+ **Which month showed the highest profit?** January emerged as the month with the highest profit, totaling 4.2304 ETH. This indicates that, among the analyzed months, January 2022 yielded the most significant profit within the specified period.
+ ![image10](https://github.com/Mokakash/NFT_Profitability_Project_SQL/blob/main/Images/10_Hoghest_Month_Profit.png?raw=true)
+ **How did profits vary month by month?**
+ ![image11](https://github.com/Mokakash/NFT_Profitability_Project_SQL/blob/main/Images/11_Monthly_Profit_Loss.png?raw=true)
+ **Is there a seasonal trend in profitability?** The profitability trend indicates a potential seasonal pattern. In this dataset, Q3 stands out with the highest profitability at 0.0719 ETH, followed by Q2 at 0.0450 ETH. However, Q1 and Q4 show comparatively lower profits at 0.0336 ETH and 0.0307 ETH, respectively. This trend suggests a potential increase in profitability during the middle half of the year (Q2 and Q3) compared to the first and last quarters (Q1 and Q4). However, to better identify seasonal trends, a broader dataset encompassing multiple years might be necessary.
+ ![image12](https://github.com/Mokakash/NFT_Profitability_Project_SQL/blob/main/Images/12_Quarterly_Profit_Loss.png?raw=true)
### Wallet Performance:
+ **Which wallet made the most profit?** The Main wallet emerged as the most profitable, generating a total profit of 26.7383 ETH. This indicates that, among the analyzed wallets, the Main wallet yielded the highest overall profit within the specified period.
+ ![image13](https://github.com/Mokakash/NFT_Profitability_Project_SQL/blob/main/Images/13_Best_Performing_Wallet.png?raw=true)
+ **What's the average profit per trade for each wallet?** The main wallet shows the highest average profit per trade at 0.0795 ETH, followed by the Burner wallet at 0.0019 ETH. Conversely, the Ledger wallet reflects an average loss per trade at -0.300 ETH.
+ ![image14](https://github.com/Mokakash/NFT_Profitability_Project_SQL/blob/main/Images/14_Avg_per_Wallet.png?raw=true)
+ **Are there any particular wallets consistently performing better in terms of profit?** Yes, the Main wallet not only gained the highest total profit but also maintained a consistently higher average profit per transaction compared to the Burner and Ledger wallets. However, we need to consider that the 'Ledger wallet' is a cold wallet primarily used for storing the highest value NFTs rather than frequent trading. This specialized usage might explain the lower profitability observed in the Ledger wallet compared to the Main wallet's active trading behavior.

The MySQL code used to derive these insights and answer questions is available in the repository as ['NFT_EDA_&_Insights.sql'](https://github.com/Mokakash/NFT_Profitability_Project_SQL/blob/main/NFT_EDA_%26_Insights.sql).

## Conclusion
In summary, the ***Mint Trade Method*** stood out as the most profitable, especially within the ***Main Wallet*** showcasing both high total profits and average profits per trade. Interestingly, while the NP alpha group generated the highest profit overall, it ranked third in average profit. This suggests that focusing more on ***LV*** (the group with the highest average profit) might have been a more beneficial investment of time, although spending time across LV, AS, and NP groups still proved advantageous. Notably, January and April were the months with the highest profits, but the ***third quarter (Q3)*** emerged as the most profitable period for trading overall.
It's essential to acknowledge that individual preferences, risk tolerance, and skills vary in trading. While Mint and specific alpha groups worked well in this analysis, other methods might suit different individuals better.

## Contributing
Contributions to enhance this analysis are welcome! 
Feel free to fork the repository and create a new branch for your modifications.
