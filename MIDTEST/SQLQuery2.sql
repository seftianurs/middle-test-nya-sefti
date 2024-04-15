CREATE TABLE item_bought (
    buyer TEXT NOT NULL,
    item TEXT NOT NULL
);

INSERT INTO item_bought (buyer, item) VALUES
('A', 'Asus'),
('B', 'Lenovo'),
('C', 'Lenovo'),
('D', 'Acer'),
('E', 'Acer'),
('F', 'Acer');

SELECT * FROM item_bought;

SELECT item
FROM item_bought
GROUP BY buyer
ORDER BY COUNT(*) DESC
LIMIT 1;

SELECT item
FROM item_bought
GROUP BY item
ORDER BY COUNT(*) ASC
LIMIT 1;

SELECT buyer
FROM item_bought
GROUP BY item
HAVING COUNT(*) < (SELECT COUNT(*) FROM item_bought GROUP BY item ORDER BY COUNT(*) DESC LIMIT 1)
AND COUNT(*) > (SELECT COUNT(*) FROM item_bought GROUP BY item ORDER BY COUNT(*) ASC LIMIT 1);
