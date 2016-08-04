1. User.all, Category.all, Tag.all, Post.all
2. User.first.comments
3. Comment.first.user = User.second
4. p.category = Category.second
5. Set a collection of comments to replace a user's current comments (e.g. User.first.comments = [Comment.first, Comment.second])
6. Return a given comment's author

```
Comment.first.user
```

7. List a given post's comments

```
Post.first.comments
```

8. Return a given comment's parent post

```
Comment.first.post
```

9. Remove one post from a category's collection of posts

```
c = Category.first.posts
c.destroy(c.first)
```

10. List the posts authored by a given user

```
User.first.posts
```

11. List the IDs of all posts authored by a given user (hint: there's an association method for this)

```
User.first.posts.ids
```

12. Set a collection of Posts to replace that user's currently authored posts,
```
User.first.posts = [Post.first, Post.second]
```

13. List the authors of a given post

```
Post.first.users
```

14. Set a collection of Users to replace a given Post's authors in a similar way

```
Post.first.users = [User.first, User.second]
```

15. Accomplish the same thing by only using IDs (hint: there's an association method for this...)

```
Post.first.user_ids = [User.first.id, User.second.id]
```

16. List the posts under a given tag

```
Tag.first.posts
```

17. Add a new post to a given tag by only using its ID

```
Tag.first.post_ids << Post.second.id
```

18. Add a new tag to a given post by only using its ID

```
Post.first.id = Tag.second.id
```

19. List the tags on a given post

```
Post.first.tags
```
