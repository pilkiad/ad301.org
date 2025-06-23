---
title: "Blog - Naive Code: Comment System"
---

*NOTE: This is the beginning of my blog series "Naive Code" in which I share
some of the stuff I code privately without any regard to safety, performance, ...*

---

For my personal blog (this one!) I wanted to create a dynamic comment system. I
already had a guestbook where everyone could sign and leave a message. Some of
the friends I showed my site to were already using it - how exciting! But I also
needed to prepare for the next big step of my blog: an actual blog with posts!

There already is quite an elegant system with which I could write my entries
(converting markdown to HTML / PHP with a simple build script) but I felt it
would be awesome if people could contribute to the posts as well, since I have
seen many other blogs around the internet do the same thing.

Luckily, I already have a naive comment system to the guestbook, I just needed
to alter it to fit the requirements I had for comments concerning specific
pages.

1. How the guestbook works
--------------------------

The guestbook on the landing page consists of these simple parts:

1. A static link to `guestbook.md` which contains the form to create an new
    entry
2. An include of `guestbook.php` which grabs all guestbook entries from the DB
    and displays them in a formatted way

The form that `guestbook.md` links to, `submit.php`, gathers these fields:

| Field     | Description                                                               |
| ---       | ---                                                                       |
| Name      | The name of the commenter                                                 |
| URL       | An optional URL to a personal page or whatever the commenter wants to link|
| Comment   | The actual comment                                                        |
| CAPTCHA   | A text field (believe it or not, for my usecase this actually works)      |

Finally, we just include the PHP-script that fetches all DB entries and displays
them.

2. Adjusting for the comment section
------------------------------------

For the comment section I introduced `submit_comment.php` which will
additionally to the fields in chapter 1. also grab

| Field     | Description                                                               |
| ---       | ---                                                                       |
| Post      | The name of the "post" or rather site the comment should be displayed on  |

while leaving out the URL.

In the markdown file that will be converted into the final site we can then link
to a `comment-md`-page that we pass the beforementioned post name:

```markdown
[Leave a comment]
    (../comment.md?post=SOME_BLOG_NAME)
```

The comment page will itself parse this to the underlying `submit_comment.php`
script which will attach the tag to the comment entry.

Then, when we want to display a page I include the PHP file responsible for
loading the comments and give it the name of the current entry as reference for
which entries to filter for:

```php
<?php
$post_name="SOME_BLOG_NAME";
include "../res/src/comments.php";
?>
```

This script fetches all entries from the DB just like before, with the minimal
change that it will not display any entries that do not have the matching `post`
tag.

3. Discussion
-------------

**Pros:**

- Comments :)

**Cons:**

- Insecure, since the post tag can be freely altered and there are next to no
    other security checks
- Unoptimized, since we grab *all* of the comments every time

---

**Comments**

[Leave a comment](../comment.md?post=blog_comment_system)

<?php $post_name="blog_comment_system"; include "../res/src/comments.php"; ?>
