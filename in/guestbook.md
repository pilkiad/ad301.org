---
title: "Sign the guestbook"
---

<form action="res/src/submit.php" method="POST" enctype="application/x-www-form-urlencoded">
    <p><label for="name">Name:</label><br>
    <input class="inset" type="text" name="name" required>
    <br></p>
    <p><label for="url">URL (optional):</label>
    <input class="inset" type="text" name="url"> <br></p>
    <label for="comment">Comment:</label>
    <textarea class="inset" name="comment" required></textarea>
    <p><br></p>
    <label for="captcha">Prove to me you are not a bot (won’t
    get published):</label>
    <textarea class="inset" name="captcha" required></textarea>
    <p><br></p>
    <button type="submit" class="button inset">
    Submit
    </button>
</form>
