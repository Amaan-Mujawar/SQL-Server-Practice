/*
Question: Binary Tree Nodes
You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.

Write a query to find the node type of Binary Tree ordered by the value of the node. Output one of the following for each node:

Root: If node is root node.
Leaf: If node is leaf node.
Inner: If node is neither root nor leaf node.

Input Format

The BST table is described as follows:
Field           Type
N               Integer
P               Integer

Sample Input
N       P
1       2
3       2
6       8
9       8
2       5
8       5
5       NULL

Sample Output

1 Leaf
2 Inner
3 Leaf
5 Root
6 Leaf
8 Inner
9 Leaf

Explanation

The Binary Tree below illustrates the sample:
        5
      /   \
    2       8
   / \     / \
  1   3   6   9
*/

-- Answer (Method 1: Using IN Subquery - Your Solution):
SELECT N,
    CASE 
        WHEN P IS NULL THEN 'Root'
        WHEN N IN (SELECT P FROM BST WHERE P IS NOT NULL) THEN 'Inner'
        ELSE 'Leaf'
    END AS NodeType
FROM BST
ORDER BY N;

/*
-- Method 2: Using EXISTS (High-Performance T-SQL Alternative)
-- In SQL Server, EXISTS is often faster than IN for large datasets because it short-circuits (stops searching) as soon as it finds the first match.
SELECT N,
    CASE 
        WHEN P IS NULL THEN 'Root'
        WHEN EXISTS (SELECT 1 FROM BST b2 WHERE b2.P = b1.N) THEN 'Inner'
        ELSE 'Leaf'
    END AS NodeType
FROM BST b1
ORDER BY N;
*/