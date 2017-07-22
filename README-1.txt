#############################
RS Mini Project: Recommenders


###############################
Notes:
- Approximate time: 3-4 hours
- 5 Files are attached that you can load for testing (tab-separated: users, items, categories, categories_items, orders)


###############################
Requirements:
Write 2 different recommender strategy classes. Your classes/objects should accomplish the following goals:
- Given a user_id and a recommendation strategy, return an item recommendation for the user
- Write test coverage for your code

Other tips:
- There should be a clear interface to using your recommendation classes
- Do pay attention to organization, formatting, syntax, code quality. This should be assumed to be production-ready code.
- Design the code so that in the future it is easy to add additional recommender strategies
- Use good OOP Principles and design patterns where relevant
- Think about scale. What if there are millions of users and millions of orders?


Recommendation Class 1: Category Recommender
Based on the purchased items, recommend items that most closely related based on the category similarity.
Must have at least 1 category in common. Must not have already been purchased by the user.

Example:
Item 1 is "Nike Dunks" with categories "Shoes", "Basketball", and "Nike"
Item  2 is "Nike Street Basketball" with categories "Balls", "Basketball" and "Nike"
Item 3 is "Addidas Jersey" with categories "Clothing", "Basketball", and "Addidas"
Item 4 is "Golf bag" with categories "Golf", "Accessories"

If user purchased item1, then they should be recommended [item 2, item 3]
(Note: item 2 is higher precedence because it has 2 matching categories)


Recommendation Class 2: Similar Users
Recommend items that other users with similar purchases have ordered.

Example:
John Doe ordered "Nike Dunks"
Jane Doe ordered "Nike Dunks" and "Nike Street Basketball"
Jim Doe ordered "Nike Street Basketball" and "Golf bag"

The recommender should recommend "Nike Street Basketball" for John Doe, "Golf bag" for Jane Doe, and "Nike Dunks" for Jim Doe

