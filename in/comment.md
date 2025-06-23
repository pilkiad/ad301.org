---
title: "Leave a comment"
---

**Got something to add?**

I'd love to hear your thoughts! Please feel free to leave a comment below.

<form action="res/src/submit_comment.php" method="POST" enctype="application/x-www-form-urlencoded">
    <p><label for="name">Name:</label><br>
    <input class="inset" type="text" name="name" required>
    <br></p>
    <label for="comment">Comment:</label>
    <textarea class="inset" name="comment" required></textarea>
    <br><br>
    <label for="captcha">Prove to me you are not a bot (won’t
    get published):</label>
    <textarea class="inset" name="captcha" required></textarea>
    <br><br>
    <input type="hidden" id="postValue" name="post" value="">
    <script>
        const urlParams = new URLSearchParams(window.location.search);
        const postId = urlParams.get('post');
        if (postId) {
            document.getElementById('postValue').value = postId;
        }
    </script>
    <button type="submit" class="button inset">
    Submit
    </button>
</form>
