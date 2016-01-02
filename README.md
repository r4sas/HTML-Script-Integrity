# HTML-Script-Integrity
Bash script i use to generate html for javascript file integrity.

##How to use:

Run the following commands to fetch script and allow it to run:

- wget https://raw.githubusercontent.com/markcoker/HTML-Script-Integrity/master/integrity.sh
- chmod +x ./integrity.sh

The syntax ./integrity.sh url, here is an example for jquery:

- ./integrity.sh https://code.jquery.com/jquery-2.1.4.min.js

It will then output the follow HTML snippet, which you can copy directly into your project:

```html
<script src="https://code.jquery.com/jquery-2.1.4.min.js" integrity="sha256-8WqyJLuWKRBVhxXIL1jBDD7SDxU936oZkCnxQbWwJVw= sha512-Pcrh/26Yxk41hr4+sU3UhsUffU6fobj5pii+T7tqmrVi8x+bUOFtLgxyuUK9voTu6ODvh/pzDbFCixmaWdiCMg==" crossorigin="anonymous"></script>
```
##What OS has it been tested on?

- MAC OSX 10.11.2 (non-extensive testing)

Feel free to let me know what systems it does/doesnt work on :)
