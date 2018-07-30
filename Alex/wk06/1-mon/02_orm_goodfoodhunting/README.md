# Notes

```txt
# tables
user
dish
comment
venue
like
category

# associations
dish 1---0..* comment

user 1---0..* dish
user 1---0..* comment

# Many-to-many
user *---* dish
category *---* dish

# Join Table
user 1---* like *---1 dish
# category 1---* dish_category *---1 dish

```
