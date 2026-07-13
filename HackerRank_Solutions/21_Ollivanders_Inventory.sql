/*
Question: Ollivander's Inventory
Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.

Input Format
The following tables contain data on the wands in Ollivander's inventory:

Wands: 
The id is the id of the wand, code is the code of the wand, coins_needed is the total number of gold galleons needed to buy the wand, and power denotes the quality of the wand (the higher the power, the better the wand is). 

Wands_Property: 
The code is the code of the wand, age is the age of the wand, and is_evil denotes whether the wand is good for the dark arts. If the value of is_evil is 0, it means that the wand is not evil. The mapping between code and age is one-one, meaning that if there are two pairs, (code1, age1) and (code2, age2), then code1 != code2 and age1 != age2.

Sample Output
9 45 1647 10
12 17 9897 10
1 20 3688 8
15 40 6018 7
19 20 7651 6
11 40 7587 5
10 20 504 5
18 40 3312 3
20 17 5689 3
5 45 6020 2
14 40 5408 1

Explanation
The query isolates the minimum galleons needed for each distinct combination of wand age and power, ensuring is_evil = 0, and returns the specific wand ID that matches that minimum price.
*/

-- Answer (Method 1: Using Correlated Subquery - Your Solution):
SELECT w.id, wp.age, w.coins_needed, w.power
FROM Wands w
INNER JOIN Wands_Property wp
    ON w.code = wp.code
WHERE wp.is_evil = 0
AND w.coins_needed = (
    SELECT MIN(w2.coins_needed)
    FROM Wands w2
    INNER JOIN Wands_Property wp2 
        ON w2.code = wp2.code
    WHERE wp2.age = wp.age AND w2.power = w.power
)
ORDER BY w.power DESC, wp.age DESC;

/*
-- Method 2: Using T-SQL Window Function (ROW_NUMBER)
-- This method partitions the data by age and power, sorting by coins_needed ASC to assign Row Number 1 to the cheapest wand in each group.
WITH RankedWands AS (
    SELECT 
        w.id, 
        wp.age, 
        w.coins_needed, 
        w.power,
        ROW_NUMBER() OVER(PARTITION BY wp.age, w.power ORDER BY w.coins_needed ASC) as rn
    FROM Wands w
    INNER JOIN Wands_Property wp 
        ON w.code = wp.code
    WHERE wp.is_evil = 0
)
SELECT id, age, coins_needed, power
FROM RankedWands
WHERE rn = 1
ORDER BY power DESC, age DESC;
*/