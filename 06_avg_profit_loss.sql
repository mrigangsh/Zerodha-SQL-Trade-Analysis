USE trading_analysis;
DROP TABLE IF EXISTS PNL;
DROP TABLE IF EXISTS TRADEBOOK;
CREATE TABLE Instruments (
    instrument_id INT AUTO_INCREMENT PRIMARY KEY,
    symbol VARCHAR(30) UNIQUE
);

CREATE TABLE Trades (
    trade_id BIGINT PRIMARY KEY,
    instrument_id INT,
    trade_date DATE,
    trade_type VARCHAR(4),
    quantity INT,
    price DECIMAL(10,2),
    order_id BIGINT,
    order_time TIME,
    FOREIGN KEY (instrument_id) REFERENCES Instruments(instrument_id)
);
CREATE TABLE PnL (
    pnl_id INT AUTO_INCREMENT PRIMARY KEY,
    instrument_id INT,
    quantity INT,
    buy_value DECIMAL(12,2),
    sell_value DECIMAL(12,2),
    realized_pnl DECIMAL(12,2),
    realized_pnl_pct DECIMAL(6,4),
    FOREIGN KEY (instrument_id) REFERENCES Instruments(instrument_id)
);
SELECT * FROM Trades LIMIT 5;
-- 🔹 Recent Zerodha Sell Trades (Essential Columns Only)
SELECT 
    i.symbol AS Instrument,
    t.trade_date AS TradeDate,
    t.trade_type AS TradeType,
    t.quantity AS Qty,
    t.price AS Price
FROM
    Trades t
        JOIN
    Instruments i ON t.instrument_id = i.instrument_id
WHERE
    t.trade_type = 'sell'
ORDER BY t.trade_date DESC
LIMIT 10;
-- 💰 Top 5 Profitable BANKNIFTY Trades (Based on Realized PnL)
SELECT 
    i.symbol AS Instrument,
    p.quantity AS Qty,
    p.buy_value AS BuyValue,
    p.sell_value AS SellValue,
    p.realized_pnl AS Profit
FROM PnL p
JOIN Instruments i ON p.instrument_id = i.instrument_id
WHERE i.symbol LIKE 'BANKNIFTY%'
ORDER BY p.realized_pnl DESC
LIMIT 5;
-- Average Buy and Sell Price per BANKNIFTY Contract
SELECT 
    i.symbol AS Instrument,
    ROUND(AVG(CASE WHEN t.trade_type = 'buy' THEN t.price END), 2) AS Avg_Buy_Price,
    ROUND(AVG(CASE WHEN t.trade_type = 'sell' THEN t.price END), 2) AS Avg_Sell_Price
FROM Trades t
JOIN Instruments i ON t.instrument_id = i.instrument_id
WHERE i.symbol LIKE 'BANKNIFTY%'
GROUP BY i.symbol
ORDER BY i.symbol;


SELECT 
    ROUND(AVG(CASE WHEN p.realized_pnl > 0 THEN p.realized_pnl END), 2) AS Avg_Profit,
    ROUND(AVG(CASE WHEN p.realized_pnl < 0 THEN p.realized_pnl END), 2) AS Avg_Loss
FROM PnL p
JOIN Instruments i ON p.instrument_id = i.instrument_id
WHERE i.symbol LIKE 'BANKNIFTY%';

