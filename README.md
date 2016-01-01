# assignment_association_practice
Just associates associatin'...

by Sia Karamalegos

## Entities and Attributes

**User** - has many post-authors, comments

  - name

**Post_Authors** - belongs to post, user

  - post_id
  - author_id

**Post** - has many post-authors, comments, post-tags; belongs to category

  - title
  - body
  - category_id

**Category** - has many posts

  - name

**Comment** - belongs to user, post

  - body
  - post_id
  - author_id

**Post_Tags** - belongs to post, tag

  - post_id
  - tag_id

**Tag** - has many post-tags

  - name

## Relationships

*(from the assigment)*

User 1:X Comments   # (User can author many comments)
Post 1:X Comments   # (Post can be commented on many times)
Category 1:X Posts # (A category can have many posts, but one post is in only one category at a time)
User X:X Posts      # (User can author many posts and a post can have many authors)
Post X:X Tags       # (Posts can have many tags but tags aren't unique)
