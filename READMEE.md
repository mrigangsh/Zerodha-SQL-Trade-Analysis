# 📊 Zerodha SQL Trade Analysis

This project analyzes trading performance using Zerodha data and SQL.

It organizes raw trade data into clean tables (`Instruments`, `Trades`, `PnL`), and runs meaningful SQL queries to uncover insights like profit/loss patterns, average price levels, and BankNIFTY strategy performance.

---

## 📁 Project Files

| File Name             | Description                               |
|----------------------|-------------------------------------------|
| `Instruments.csv`     | Instrument ID and symbol mapping          |
| `Trades.csv`          | All buy/sell transactions with price/time |
| `cleaned_pnl.csv`     | PnL details – buy/sell value, profits     |
| `06_avg_profit_loss.sql` | SQL queries for BankNIFTY analysis     |

---

## 🔑 Key SQL Queries

- ✅ Total Quantity Traded  
- 💰 Top 5 Profitable BankNIFTY Trades  
- 📉 Average Buy/Sell Price  
- 📈 Average Profit on Winning Trades  
- ⚠️ Average Loss on Losing Trades  

---

## 🛠️ Tech Stack

- MySQL
- MySQL Workbench
- Visual Studio Code
- Git & GitHub
