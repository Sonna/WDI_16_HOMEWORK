SELECT id, name FROM dishes;
--  id |                name
-- ----+------------------------------------
--   3 | sandwich
--   4 | macaroon
--   5 | pancakes
--   2 | can't believe it's pudding pudding
-- (4 rows)

INSERT INTO comments (content, dish_id) values ('yum', 2);
-- INSERT 0 1

SELECT id, content, dish_id FROM comments;
--  id | content | dish_id
-- ----+---------+---------
--   1 | yum     |       2
-- (1 row)
