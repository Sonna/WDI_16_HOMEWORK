- Passwords get salted when entering the database so that they are recognisable
  when digested within the system

- Digested passwords are non-reversible (or harder to reverse-engineer)

- Examples of encryption libraries:
  * BCrypt


- User model

  ```relationships
    # models
    Dishes
    Comments
    Users

    # relations

    Dish --* Comments

    User --* Comments
    User --* Dishes
  ```
