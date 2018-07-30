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

DELETE FROM dishes WHERE id = 2;
-- ERROR:  update or delete on table "dishes" violates foreign key constraint "comments_dish_id_fkey" on table "comments"
-- DETAIL:  Key (id)=(2) is still referenced from table "comments".
