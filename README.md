# ad301.org

> AKA the most elegant static site generator ever built _- pilkiad_

Source code for my personal site. Uses a simple but very practical solution:

1. All pages are markdown files in the `in/` directory
2. We use [pandoc](https://pandoc.org/) to convert them to
    1. `html` files for locally previewing
    2. `php` files for online deployment
    3. Replace all links to other `md` files by the respective target format
3. There is a single monolythic `template.html` file defining how all pages look
4. We additionaly copy the `res/` directory which contains content which does
    not need to be converted, i.e. source code (lots of stuff hidden for
    security reasons)
5. All generated output is placed in the `out/` directory which can instantly be
    copied to the server

... aaand done! There is only a single `build.sh` script which does all of this
for me everytime I want to update the site. So if I wish to create a blog post
or upload some music I only need to create a single markdown file.
